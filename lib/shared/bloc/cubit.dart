import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/modules/for_admin/admin_home_screen.dart';
import 'package:saas/modules/for_advisor/homeAdvisor_screen.dart';
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
      selectedRoleMainPage = MainPage(currentUser.userLogin?.token);
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

    DioHelper.postData(
            LOGIN,
            null,
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

    DioHelper.postData(
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

  late Advisor allAdvisorsData;

  void allAdvisors(String token) {
    emit(GetAdvisorsLoadingState());

    DioHelper.getData(GET_ADVISORS, token, null).then((value) {
      print(value.data);
      //allAdvisorsData = Advisor.fromJson(value.data);
      emit(GetAdvisorsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAdvisorsErrorState(error.toString()));
    });
  }

  late Course allCoursesData;

  void allCourses(String token, String categoryID) {
    emit(GetCoursesLoadingState());

    DioHelper.postData(
            GET_COURSES,
            token,
            {
              'categoryid': categoryID
            },
            null
    ).then((value) {
      print(value.data);
      allCoursesData = Course.fromJson(value.data);
      emit(GetCoursesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCoursesErrorState(error.toString()));
    });
  }

  late SemesterAndGrade semAndGra;


  void getSemestersAndGrades(String token) {
    emit(semesterAndGradesLoadingState());

    DioHelper.getData(SEMESTERS_GRADES, token, null).then((value) {
      print(value.data.length);
      if(value.data.length > 0){
        semAndGra = SemesterAndGrade.fromJson(value.data[0]);
        for(var i=0;i<value.data.length;i++) {
          semestersAndGrades.add(
              SemesterAndGrade(
                  semesterName: SemesterAndGrade.fromJson(value.data[i]).semesterName,
                  gpAofSemester: SemesterAndGrade.fromJson(value.data[i]).gpAofSemester
              ));
        }
      }
      else{
        semestersAndGrades = [];
      }
      emit(semesterAndGradesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(semesterAndGradesErrorState(error.toString()));
    });
  }


  late CurrentCourse currCourses;


  void getCurrentCourses(String token) {
    emit(CurrentCoursesLoadingState());

    DioHelper.getData(CURRENT_COURSES, token, null).then((value) {

      if(value.data.length > 0){
       // currCourses = CurrentCourse.fromJson(value.data[0]);
        for(var i=0;i<value.data.length;i++) {
          currentCourses.add(
              CurrentCourse(
                  courseName: CurrentCourse.fromJson(value.data[i]).courseName,
                  courseCode: CurrentCourse.fromJson(value.data[i]).courseCode,
                  instructorName: CurrentCourse.fromJson(value.data[i]).instructorName
              )
          );
          print(value.data[i]);
        }
        print(currentCourses.length.toString());
      }
      else{
        currentCourses = [];
      }
      emit(CurrentCoursesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CurrentCoursesErrorState(error.toString()));
    });
  }

}
