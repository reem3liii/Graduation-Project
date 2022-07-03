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

  //late String selectedRole;

  String selectedRole ="";
  //String selectedRole ="Student";

  /*void changeRole(String role) {
    selectedRole = role;
    emit(AppChangeRoleState());
  }
  Future selectRole(String role) async {
    return currentUser.userLogin!.roles![0];
  }*/

  var selectedRoleMainPage;


  void enterSelectedRole() {
    if (currentUser.userLogin?.roles?.first.toString() == "Student") {
      selectedRoleMainPage = MainPage();
    } else if (currentUser.userLogin?.roles?.last.toString() == "Coordinator" )
    {
      selectedRoleMainPage = const HomeAdminScreen();
    }
    else
      {
        selectedRoleMainPage = const HomeAdvisorScreen();
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

    DioHelper.postUserData(LOGIN, {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      currentUser = CurrentUser.fromJson(value.data);
      //currentUser.userLogin.roles.first.toString();
      emit(LoginSuccessState(currentUser));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
}
