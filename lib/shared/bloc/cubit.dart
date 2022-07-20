import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/modules/for_admin/admin_home_screen.dart';
import 'package:saas/modules/for_advisor/advisor_screen.dart';
import 'package:saas/modules/for_student/details.dart';
import 'package:saas/modules/for_student/home_screen.dart';
import 'package:saas/modules/for_student/main_page.dart';
import 'package:saas/modules/for_student/profile_screen.dart';
import 'package:saas/modules/gpa_calculator/gpa_page.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/dio_helper.dart';
import 'package:saas/shared/items/end_points.dart';
import 'package:saas/shared/items/json_models.dart';
import 'package:saas/shared/items/models.dart';
import '../items/data.dart';
import 'package:dio/dio.dart';

//import '../data.dart';
class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  void ispassword() {
    isPassword = !isPassword;
    emit(AppIsPasswordState());
  }

  String selectedRole = "";
  var selectedRoleMainPage;

  void enterSelectedRole() {
    if (currentUser.userLogin?.roles?.first.toString() == "Student") {
      selectedRoleMainPage = MainPage(currentUser.userLogin?.token);
    } else if (currentUser.userLogin?.roles?.last.toString() == "Coordinator") {
      selectedRoleMainPage = HomeAdminScreen(
          currentUser.userLogin?.token, currentUser.userLogin?.email);
    } else {
      CurrentUserFunc(currentUser.userLogin?.token);

      selectedRoleMainPage = AdvisorScreen(
        currentUser.userLogin?.token,
        currentUser.userLogin?.email,
        currentUser.userLogin!.username,
        currentUser.userLogin!.id,
        currentUser.userLogin!.roles,
        currentUserList,
      );
    }
    emit(AccessTheCurrentRoleState());
  }

  List<String> currentUserList = [];
  void CurrentUserFunc(String? token) {
    emit(GetCurrentUserLoadingState());
    var i = 0;
    DioHelper.getData(GET_CURRENT_USER, token, null).then((value) {
      currentUserList.add(value.data["name"].toString());
      currentUserList.add(value.data["gender"].toString());
      currentUserList.add(value.data["brithOfdate"].toString());
      currentUserList.add(value.data["address"].toString());
      currentUserList.add(value.data["city"].toString());
      currentUserList.add(value.data["phoneNumber"].toString());


      // currentUserFuncvar![i++] = value.data["nameArb"];
      // currentUserFuncvar![i++] = value.data["gender"];
      // currentUserFuncvar![i++] = value.data["male"];
      // currentUserFuncvar![i++] = value.data["brithOfdate"];
      //  currentUserFuncvar![i++] = value.data["phoneNumber"];
      //  print(currentUserFuncvar![0]);
      //allAdvisorsData = Advisor.fromJson(value.data);
      for (int i = 0; i < currentUserList.length;i++){
        print(currentUserList[i]);

      }
      emit(GetCurrentUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCurrentUserErrorState(error.toString()));
    });
  }

  int selectedIndex = 0;
  final screens = [
    HomeScreen(token),
    Details(),
    GPACalculator(),
    const ProfileScreen(),
  ];

  void changeIndex(int index) {
    selectedIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  var arrayOfVisible =
      List<bool>.generate(int.parse(data[5].toString()), (i) => false);

  //bool isVisible = false;
  void visible(int index) {
    arrayOfVisible[index] = !arrayOfVisible[index];
    emit(AppIsVisibleState());
  }

  List<bool> visibilAdvisors = [false];
  List<bool> upAdvisors = [false];
  void showAdvisor(int index) {
    visibilAdvisors[index] = !visibilAdvisors[index];
    upAdvisors[index] = !upAdvisors[index];
    emit(AdvisorShowState());
  }

  late CurrentUser currentUser;

  void userLogin(String email, String password) {
    emit(LoginLoadingState());

    DioHelper.postDataWithoutAuth(
            LOGIN,
            {
              'email': email,
              'password': password,
            },
            null)
        .then((value) {
      print(value.data);
      currentUser = CurrentUser.fromJson(value.data);
      if (currentUser.status.toString() == 'success') {
        token = currentUser.userLogin!.token.toString();
      }
      //currentUser.userLogin.roles.first.toString();
      emit(LoginSuccessState(currentUser));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  late addUser addResponse;

  void addAdvisor(
      String token,
      String ssn,
      String name,
      String arabicName,
      String gender,
      String BOD,
      String phone,
      int level,
      String mail,
      String pass,
      String city,
      String address) {
    emit(AddAdvisorLoadingState());

    DioHelper.postDataWithAuth(
            ADD_ADVISOR,
            token,
            {
              'brithOfdate': BOD,
              'email': mail,
              'emailConfirmed': mail,
              'gender': gender,
              'level': level,
              'name': name,
              'nameArb': arabicName,
              'password': pass,
              'passwordConfirmed': pass,
              'phoneNumber': phone,
              'ssn': ssn,
              'city': city,
              'address': address,
            },
            null)
        .then((value) {
      //print(value.data);
      addResponse = addUser.fromJson(value.data);
      print(addResponse.message);
      emit(AddAdvisorSuccessState(addResponse));
    }).catchError((error) {
      print(error.toString());
      emit(AddAdvisorErrorState(error.toString()));
    });
  }

  late List<dynamic> allAdvisorsData;

  void allAdvisors(String token) {
    emit(GetAdvisorsLoadingState());

    DioHelper.getDataWithAuth(GET_ADVISORS, token, null).then((value) {
      print(value.data);
      allAdvisorsData = value.data;
      emit(GetAdvisorsSuccessState(allAdvisorsData));
    }).catchError((error) {
      print(error.toString());
      emit(GetAdvisorsErrorState(error.toString()));
    });
  }

  late List<dynamic> allCoursesData;

  void allCourses(String token, String categoryID) {
    emit(GetCoursesLoadingState());
    var formData = FormData.fromMap({'categoryid': categoryID});

    DioHelper.postDataWithAuth(GET_COURSES, token, formData, null)
        .then((value) {
      print(value.data);
      allCoursesData = value.data;
      emit(GetCoursesSuccessState(allCoursesData));
    }).catchError((error) {
      print(error.toString());
      emit(GetCoursesErrorState(error.toString()));
    });
  }

  //Student part (API)
  //late SemesterAndGrade semAndGra;

  void getSemestersAndGrades(String token) {
    emit(semesterAndGradesLoadingState());

    DioHelper.getDataWithAuth(SEMESTERS_GRADES, token, null).then((value) {
      if (value.data.length > 0) {
        //semAndGra = SemesterAndGrade.fromJson(value.data[0]);
        for (var i = 0; i < value.data.length; i++) {
          semestersAndGrades.add(SemesterAndGrade(
              semesterName:
                  SemesterAndGrade.fromJson(value.data[i]).semesterName,
              gpAofSemester:
                  SemesterAndGrade.fromJson(value.data[i]).gpAofSemester));
          print(value.data[i].toString());
        }
      } else {
        semestersAndGrades = [];
      }
      emit(semesterAndGradesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(semesterAndGradesErrorState(error.toString()));
    });
  }

  void getCurrentCourses(String token) {
    emit(CurrentCoursesLoadingState());

    DioHelper.getDataWithAuth(CURRENT_COURSES, token, null).then((value) {
      if (value.data.length > 0) {
        for (var i = 0; i < value.data.length; i++) {
          currentCourses.add(CurrentCourse(
              courseName: CurrentCourse.fromJson(value.data[i]).courseName,
              courseCode: CurrentCourse.fromJson(value.data[i]).courseCode,
              instructorName:
                  CurrentCourse.fromJson(value.data[i]).instructorName));
          print(value.data[i]);
        }
      } else {
        currentCourses = [];
      }
      emit(CurrentCoursesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CurrentCoursesErrorState(error.toString()));
    });
  }

  //late TotalHoursAndGpa total_hour_gpa;

  void getTotalHoursAndGpa(String token) {
    emit(TotalHoursAndGpaLoadingState());

    DioHelper.getDataWithAuth(TOTAL_HOURS_AND_GPA, token, null).then((value) {
      print(value.data);
      totalHours = TotalHoursAndGpa.fromJson(value.data).hours!;
      totalGpa = TotalHoursAndGpa.fromJson(value.data).gpa!;
      emit(TotalHoursAndGpaSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(TotalHoursAndGpaErrorState(error.toString()));
    });
  }

  late List<dynamic> coursesOnSemester;

  void getCoursesOnSemester(String token, String semestername) {
    emit(CoursesOnSemesterLoadingState());
    var formData = FormData.fromMap({'semestername': semestername});
    courses_Semester = [];
    DioHelper.postDataWithAuth(COURSES_ON_SEMESTERS, token, formData, null)
        .then((value) {
      //print(value.data);
      for (var i = 0; i < value.data.length; i++) {
        courses_Semester.add(CoursesOnSemester(
          courseName: CoursesOnSemester.fromJson(value.data[i]).courseName,
          gpa: CoursesOnSemester.fromJson(value.data[i]).gpa,
        ));
        //print(value.data[i]);
      }
      coursesOnSemester = value.data;
      print(coursesOnSemester);
      emit(CoursesOnSemesterSuccessState(coursesOnSemester));
    }).catchError((error) {
      print(error);
      emit(CoursesOnSemesterErrorState(error.toString()));
    });
  }

  void getCurrentUserData(String token) {
    emit(CurrentUserDataLoadingState());

    DioHelper.getDataWithAuth(CURRENT_USER_DATA, token, null).then((value) {
      print(value.data);
      currentUserInf = CurrentUserData.fromJson(value.data);
      userInformation.add(currentUserInf!.department.toString().toUpperCase());
      userInformation.add((semestersAndGrades.length + 1).toString());
      userInformation.add(currentUserInf!.acceptenceYear.toString());
      userInformation.add(currentUserInf!.brithOfdate.toString().substring(0, 10));
      userInformation.add(currentUserInf!.phoneNumber.toString());
      userInformation.add(currentUserInf!.city.toString());
      userInformation.add(currentUserInf!.address.toString());
      userInformation.add(currentUserInf!.gender.toString());
      emit(CurrentUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CurrentUserDataErrorState(error.toString()));
    });
  }

  void getIsCheckControl(String token) {
    emit(GetIsCheckControlLoadingState());

    DioHelper.getDataWithAuth(IS_CHECK_CINTROL, token, null).then((value) {
      isCheckControl = value.data;
      print(isCheckControl);
      emit(GetIsCheckControlSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetIsCheckControlErrorState(error.toString()));
    });
  }

  late RecommendedCourses recommCourses;

  void postRecommendedCourses(String token) {
    emit(GetRecommendedCoursesLoadingState());
    DioHelper.postDataWithAuth(RECOMENEDED_COURSES, token, null,null)
        .then((value) {
      recCourses=[];
      recCoursesForStudent = [];
      semesterHours = 0;
      recommCourses = RecommendedCourses.fromJson(value.data);
      if(recommCourses.status.toString() == "Success"){
        minHours = recommCourses.min!.toInt();
        maxHours = recommCourses.max!.toInt();
        for (var i=0; i< recommCourses.courses!.length;i++) {
          recCourses.add(recommCourses.courses![i].toString());
          //print(recommCourses.courses![i].toString());
        }
      }

      print(value.data);
      emit(GetRecommendedCoursesSuccessState(recommCourses));
    }).catchError((error) {
      print(error);
      emit(GetRecommendedCoursesErrorState(error.toString()));
    });
  }


  late  RegisterRecCoursesForStudent regRecCoursesForStudent;

  void postRegisterRecCoursesForStudent(String token, List<String> recCoursesForStudent) {
    emit(RegisterRecCoursesForStudentLoadingState());
    DioHelper.postDataWithAuth(REGISTER_REC_COURSES_FOR_STUDENT, token, recCoursesForStudent, null)
        .then((value) {
      regRecCoursesForStudent = RegisterRecCoursesForStudent.fromJson(value.data);
      print(value.data);
      emit(RegisterRecCoursesForStudentSuccessState(regRecCoursesForStudent));
    }).catchError((error) {
      print(error);
      emit(RegisterRecCoursesForStudentErrorState(error.toString()));
    });
  }

  //End Student Part***************

  late List<dynamic> allStudentsData;

  void allStudents(String token, String level) {
    emit(GetStudentsLoadingState());
    var formData = FormData.fromMap({'level': level});
    DioHelper.postDataWithAuth(GET_STUDENTS, token, formData, null)
        .then((value) {
      print(value.data);
      allStudentsData = value.data;
      emit(GetStudentsSuccessState(allStudentsData));
    }).catchError((error) {
      print(error.toString());
      emit(GetStudentsErrorState(error.toString()));
    });
  }

  late addUser addStudentResponse;

  void AddStudent(
      String token,
      String ssn,
      String name,
      String arabicName,
      String gender,
      String BOD,
      String phone,
      int semester,
      String city,
      String address,
      String prevQua,
      String inst,
      int gradYear,
      String accYear,
      String dept,
      int totalDeg,
      int preDeg,
      String mail,
      String pass) {
    emit(AddStudentLoadingState());

    DioHelper.postDataWithAuth(
            ADD_STUDENT,
            token,
            {
              'brithOfdate': BOD,
              'email': mail,
              'emailConfirmed': mail,
              'gender': gender,
              'name': name,
              'nameArb': arabicName,
              'password': pass,
              'passwordConfirmed': pass,
              'phoneNumber': phone,
              'semester': semester,
              'ssn': ssn,
              'city': city,
              'address': address,
              'previousQualification': prevQua,
              'institute': inst,
              'graduationYear': gradYear,
              'acceptenceYear': accYear,
              'department': dept,
              'total': totalDeg,
              'precentage': preDeg
            },
            null)
        .then((value) {
      print(value.data);
      addStudentResponse = addUser.fromJson(value.data);
      print(addStudentResponse.message);
      emit(AddStudentSuccessState(addStudentResponse));
    }).catchError((error) {
      print(error.toString());
      emit(AddStudentErrorState(error.toString()));
    });
  }

  late String addCourseResponce;

  void addCourse(
    String token,
    String code,
    String name,
    String arabicName,
    String category,
    String level,
    int hours,
    int degree,
    String doctor,
  ) {
    emit(AddCoursesLoadingState());

    DioHelper.postDataWithAuth(
            ADD_COURSE,
            token,
            {
              "courseId": code,
              "title": name,
              "titleArb": arabicName,
              "grade": degree,
              "numOfHours": hours,
              "categoryId": category,
              "level": level,
              "instructorId": doctor
            },
            null)
        .then((value) {
      print(value.data);
      addCourseResponce = value.data;
      emit(AddCoursesSuccessState(addCourseResponce));
    }).catchError((error) {
      print(error.toString());
      emit(AddCoursesErrorState(error.toString()));
    });
  }

  /*late dynamic updateCourseResponce;

  void updateCourse(
    String token,
    String code,
    String name,
    String arabicName,
    String category,
    String level,
    int hours,
    int degree,
    String doctor,
  ) {
    emit(UpdateCoursesLoadingState());

    DioHelper.updateDataWithAuth(
      UPDATE_COURSE,
      token,
      {"id": code},
      {
        "courseId": code,
        "title": name,
        "titleArb": arabicName,
        "grade": degree,
        "numOfHours": hours,
        "categoryId": category,
        "level": level,
        "instructorId": doctor
      },
    ).then((value) {
      print(value.data);
      updateCourseResponce = value.data;
      emit(UpdateCoursesSuccessState(updateCourseResponce));
    }).catchError((error) {
      print(error.toString());
      emit(UpdateCoursesErrorState(error.toString()));
    });
  }

  late Map<String,dynamic> courseByID;

  void getCourseByID(String token, String id) {
    emit(GetCourseByIDLoadingState());
    DioHelper.postDataWithAuth(GET_COURSE_BY_ID, token, null, {"id": id})
        .then((value) {
      print(value.data);
      courseByID = value.data;
      emit(GetCourseByIDSuccessState(courseByID));
    }).catchError((error) {
      print(error);
      emit(GetCourseByIDErrorState(error.toString()));
    });
  }*/

  void deleteAdvisor(String token, String ssn) {
    emit(DeleteAdvisorLoadingState());
    var formData = FormData.fromMap(
      {
        'ssn': ssn,
      },
    );
    DioHelper.deleteDataWithAuth(DELETE_ADVISOR, token, formData, null)
        .then((value) {
      WidgetsFlutterBinding.ensureInitialized();
      print(value.data);
      //allAdvisors(token);
      emit(DeleteAdvisorSuccessState(value.data));
    }).catchError((error) {
      print(error.toString());
      emit(DeleteAdvisorErrorState(error.toString()));
    });
  }


  List<String> categoryID = [
    "Computer Science ",
    "General requirements ",
    "Information System ",
    "Basic Sciences - Mathematics ",
    "Software Engineering ",
    "University requirements ",
  ];

  Map<String, List<Map<String, String>>> categoryCourses = {
    "Computer Science ": [
      {
        "instructorName": "Dr.Ahmed Fouad",
        "courseName": "Introduction to Computer Science",
        "courseCode": "CSC101",
        "level": "Level 1"
      },
      {
        "instructorName": "Dr.Ahmed Fouad",
        "courseName": "Digital Circuit",
        "courseCode": "CSC102",
        "level": "Level 1"
      },
      {
        "instructorName": "Mohamed Asab",
        "courseName": "Operating Systems",
        "courseCode": "CSC303",
        "level": "3"
      }
    ],

    "General requirements ": [
      {
        "instructorName": "Dr.Reem Ali",
        "courseName": "Discrete Mathematics",
        "courseCode": "MAT401",
        "level": "4"
      }
    ],

    "Information System ": [
      {
        "instructorName": "Dr.Marwa Ahmed",
        "courseName": "Introduction to Information Systems",
        "courseCode": "ISC101",
        "level": "Level 1"
      }
    ],
    "Basic Sciences - Mathematics ": [
      {
        "instructorName": "Dr.Marwa Ahmed",
        "courseName": "Discrete Mathematics",
        "courseCode": "MAT101",
        "level": "Level 1"
      },
      {
        "instructorName": "Dr.Marwa Ahmed",
        "courseName": "Statistics and Probability",
        "courseCode": "MAT102",
        "level": "Level 1"
      },
      {
        "instructorName": "Dr.Reem Ali",
        "courseName": "Math",
        "courseCode": "MAT404",
        "level": "1"
      },
      {
        "instructorName": "Dr.Reem Ali",
        "courseName": "Math 2",
        "courseCode": "MAT410",
        "level": "1"
      }
    ],
    "Software Engineering ": [
      {
        "instructorName": "Dr.Reem Ali",
        "courseName": "Software Engineering I",
        "courseCode": "SEN201",
        "level": "2"
      },
      {
        "instructorName": "Dr.Reem Ali",
        "courseName": "Software Engineering II",
        "courseCode": "SEN202",
        "level": "Level 2"
      }
    ],
    "University requirements ": [
      {
        "instructorName": "Ahmed Ali",
        "courseName": "University English",
        "courseCode": "UNI101",
        "level": "Level 1"
      },
      {
        "instructorName": "Ahmed Ali",
        "courseName": "Introduction to Quality and Anti-corruption",
        "courseCode": "UNI102",
        "level": "Level 1"
      }
    ],
  };
  int level = -1;
  String? dropdownValue;
  var levelsList = <DropdownMenuItem<String>>[
    DropdownMenuItem(child: Text('level 1'), value: "1"),
    DropdownMenuItem(child: Text('level 2'), value: "2"),
    DropdownMenuItem(child: Text('level 3'), value: "3"),
    DropdownMenuItem(child: Text('level 4'), value: "4"),
  ];
  void changeLevelNumber(String? newValue) async {
    dropdownValue = newValue!;
    level = int.parse(newValue);
    print(level);
    emit(LevelNumberChanged());
    changeLoading();
  }

  bool loading = false;
  void changeLoading() {
    loading = !loading;
    emit(ChangeLoadingState());
  }




void editRecProcControll(String token, bool state) {
    emit(EditRecProcControllLoadingState());
    
    DioHelper.updateDataWithAuth(EDIT_RECOMENEDED_COURSES_CONTROL, token, null, state)
        .then((value) {
      print(value.data);
      emit(EditRecProcControllSuccessState(value.data));
    }).catchError((error) {
      print(error.toString());
      emit(EditRecProcControllErrorState(error.toString()));
    });
  }

//Block END
}
