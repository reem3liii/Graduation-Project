import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/modules/for_student/details.dart';
import 'package:saas/modules/for_student/home_screen.dart';
import 'package:saas/modules/for_student/profile_screen.dart';
import 'package:saas/modules/gpa_calculator/gpa_page.dart';
import 'package:saas/shared/bloc/states.dart';

import '../cache_helper.dart';
import '../data.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isArabic = false;

  //bool isArabic() {
  // arabic = !arabic;
  // emit(AppChangeLanguageState());
  // return arabic;
  // }
  void changeLanguage() {
    isArabic = !isArabic;
    emit(AppChangeLanguageState());
  }

  void refresh() {
    emit(AppRefreshState());
  }

  bool isPassword = true;
  void ispassword() {
    isPassword = !isPassword;
    emit(AppIsPasswordState());
  }

  /*int selectedIndex = 0;
  final screens = [
    HomeScreen(),
    Details(),
    GPACalculator(),
    ProfileScreen(),
  ];

  void changeIndex(int index){
    selectedIndex = index;
    emit(AppChangeBottomNavBarState());
  }*/

  var arrayOfVisible =
      List<bool>.generate(int.parse(data[5].toString()), (i) => false);

  //bool isVisible = false;
  void visible(int index) {
    arrayOfVisible[index] = !arrayOfVisible[index];
    emit(AppIsVisibleState());
  }

  bool isLightTheme = true;
  void ChangeMode(bool state) {
    isLightTheme = !state;
    emit(AppChangeModeThemeState());
  }
}
