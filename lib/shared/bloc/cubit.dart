import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/modules/for_admin/add_course.dart';
import 'package:saas/modules/for_admin/add_student.dart';
import 'package:saas/modules/for_admin/admin_home_screen.dart';
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
import 'package:bloc/src/bloc.dart';
import '../cache_helper.dart';

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
      selectedRoleMainPage = MainPage();
    } else if (currentUser.userLogin?.roles?.last.toString() == "Coordinator") {
      selectedRoleMainPage = HomeAdminScreen(
          currentUser.userLogin?.token, currentUser.userLogin?.email);
    } else {
      selectedRoleMainPage = GPACalculator();
    }
    emit(AccessTheCurrentRoleState());
  }

  int selectedIndex = 0;
  final screens = [
    HomeScreen(),
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
      String pass) {
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

  late List<dynamic> allStudentsData;

  void allStudents(String token, int level) {
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

  late dynamic updateCourseResponce;

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
  }

//Block END
}
