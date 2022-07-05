import 'package:saas/shared/items/models.dart';

import '../items/json_models.dart';

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

class LoginLoadingState extends AppStates {}

class LoginSuccessState extends AppStates {
  final CurrentUser currentUser;
  LoginSuccessState(this.currentUser);
}

class LoginErrorState extends AppStates {
  final String error;
  LoginErrorState(this.error);
}

class AddAdvisorLoadingState extends AppStates {}

class AddAdvisorSuccessState extends AppStates {
  final addUser addResponse;
  AddAdvisorSuccessState(this.addResponse);
}

class AddAdvisorErrorState extends AppStates {
  final String error;
  AddAdvisorErrorState(this.error);
}

class GetAdvisorsLoadingState extends AppStates {}

class GetAdvisorsSuccessState extends AppStates {
  //final Advisor advisor;
  //GetAdvisorsSuccessState(this.advisor);
}

class GetAdvisorsErrorState extends AppStates {
  final String error;
  GetAdvisorsErrorState(this.error);
}

class GetCoursesLoadingState extends AppStates {}

class GetCoursesSuccessState extends AppStates {
  //final Advisor advisor;
  //GetAdvisorsSuccessState(this.advisor);
}

class GetCoursesErrorState extends AppStates {
  final String error;
  GetCoursesErrorState(this.error);
}



// ignore: camel_case_types
class semesterAndGradesLoadingState extends AppStates {}
// ignore: camel_case_types
class semesterAndGradesSuccessState extends AppStates {}
// ignore: camel_case_types
class semesterAndGradesErrorState extends AppStates {
  final String error;
  semesterAndGradesErrorState(this.error);
}

// ignore: camel_case_types
class CurrentCoursesLoadingState extends AppStates {}
// ignore: camel_case_types
class CurrentCoursesSuccessState extends AppStates {}
// ignore: camel_case_types
class CurrentCoursesErrorState extends AppStates {
  final String error;
  CurrentCoursesErrorState(this.error);
}

