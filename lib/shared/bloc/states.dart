import 'package:saas/shared/items/models.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppIsPasswordState extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

class AppIsVisibleState extends AppStates {}

class AppChangeModeThemeState extends AppStates {}

class AppChangeRoleState extends AppStates {}

class AccessTheCurrentRoleState extends AppStates {}

class AppChangeBottomNavBarAdminState extends AppStates {}

class AdvisorShowState extends AppStates {}

class LoginSuccessState extends AppStates {
  final CurrentUser currentUser;
  LoginSuccessState(this.currentUser);
}

class LoginErrorState extends AppStates {
  final String error;
  LoginErrorState(this.error);
}

class LoginLoadingState extends AppStates {}
