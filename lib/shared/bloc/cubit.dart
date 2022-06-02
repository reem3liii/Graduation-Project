import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/modules/for_admin/admin_home_screen.dart';
import 'package:saas/modules/for_student/details.dart';
import 'package:saas/modules/for_student/home_screen.dart';
import 'package:saas/modules/for_student/main_page.dart';
import 'package:saas/modules/for_student/profile_screen.dart';
import 'package:saas/modules/gpa_calculator/gpa_page.dart';
import 'package:saas/shared/bloc/states.dart';
import '../items/data.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  void ispassword() {
    isPassword = !isPassword;
    emit(AppIsPasswordState());
  }

  int selectedMode = 0;
  void changeMode(int mode) {
    selectedMode = mode;
    emit(AppChangeModeState());
  }

  var selectedModeMainPage;

  void enterSelectedMode() {
    if (selectedMode == 0) {
      selectedModeMainPage = MainPage();
    } else if (selectedMode == 2) {
      selectedModeMainPage = const HomeAdminScreen();
    }
    emit(AccessTheCurrentModeState());
  }

  int selectedIndex = 0;
  final screens = [
    HomeScreen(),
    Details(),
    GPACalculator(),
    const ProfileScreen(),
  ];

  /* selectedAdminIndex = 0;
  final adminScreens = [
    const HomeAdminScreen(),
    StudentSettingAdminScreen(),
    const AdminProfileScreen(),
    const AdminProfileScreen(),
  ];*/

  void changeIndex(int index) {
    selectedIndex = index;
    emit(AppChangeBottomNavBarState());
  }
  /*void changeAdminIndex(int index) {
    selectedAdminIndex = index;
    emit(AppChangeBottomNavBarAdminState());
  }*/

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
}
