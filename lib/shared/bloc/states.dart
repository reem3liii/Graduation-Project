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

class AddStudentLoadingState extends AppStates {}

class AddStudentSuccessState extends AppStates {
  final addUser addResponse;
  AddStudentSuccessState(this.addResponse);
}

class AddStudentErrorState extends AppStates {
  final String error;
  AddStudentErrorState(this.error);
}

class AddCoursesLoadingState extends AppStates {}

class AddCoursesSuccessState extends AppStates {
  final String response;
  AddCoursesSuccessState(this.response);
}

class AddCoursesErrorState extends AppStates {
  final String error;
  AddCoursesErrorState(this.error);
}

class GetAdvisorsLoadingState extends AppStates {}

class GetAdvisorsSuccessState extends AppStates {
  final List<dynamic> advisors;
  GetAdvisorsSuccessState(this.advisors);
}

class GetAdvisorsErrorState extends AppStates {
  final String error;
  GetAdvisorsErrorState(this.error);
}

class GetCoursesLoadingState extends AppStates {}

class GetCoursesSuccessState extends AppStates {
  final List<dynamic> courses;
  GetCoursesSuccessState(this.courses);
}

class GetCoursesErrorState extends AppStates {
  final String error;
  GetCoursesErrorState(this.error);
}

//Start Student States

// ignore: camel_case_types
class semesterAndGradesLoadingState extends AppStates {}
// ignore: camel_case_types
class semesterAndGradesSuccessState extends AppStates {
  //final List<dynamic> semesAndGrades;
  //semesterAndGradesSuccessState(this.semesAndGrades);
}
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


class TotalHoursAndGpaLoadingState extends AppStates {}
// ignore: camel_case_types
class TotalHoursAndGpaSuccessState extends AppStates {}
// ignore: camel_case_types
class TotalHoursAndGpaErrorState extends AppStates {
  final String error;
  TotalHoursAndGpaErrorState(this.error);
}


class CoursesOnSemesterLoadingState extends AppStates {}
// ignore: camel_case_types
class CoursesOnSemesterSuccessState extends AppStates {
  final List<dynamic> courses;
  CoursesOnSemesterSuccessState(this.courses);
}
// ignore: camel_case_types
class CoursesOnSemesterErrorState extends AppStates {
  final String error;
  CoursesOnSemesterErrorState(this.error);
}

class CurrentUserDataLoadingState extends AppStates {}
// ignore: camel_case_types
class CurrentUserDataSuccessState extends AppStates {
}
// ignore: camel_case_types
class CurrentUserDataErrorState extends AppStates {
  final String error;
  CurrentUserDataErrorState(this.error);
}

class GetIsCheckControlLoadingState extends AppStates {}

class GetIsCheckControlSuccessState extends AppStates {}

class GetIsCheckControlErrorState extends AppStates {
  final String error;
  GetIsCheckControlErrorState(this.error);
}

class GetRecommendedCoursesLoadingState extends AppStates {}

class GetRecommendedCoursesSuccessState extends AppStates {}

class GetRecommendedCoursesErrorState extends AppStates {
  final String error;
  GetRecommendedCoursesErrorState(this.error);
}
//End Student States

class GetStudentsLoadingState extends AppStates {}

class GetStudentsSuccessState extends AppStates {
  final List<dynamic> students;
  GetStudentsSuccessState(this.students);
}

class GetStudentsErrorState extends AppStates {
  final String error;
  GetStudentsErrorState(this.error);
}


/*class UpdateCoursesLoadingState extends AppStates {}

class UpdateCoursesSuccessState extends AppStates {
  final dynamic updateResponse;
  UpdateCoursesSuccessState(this.updateResponse);
}

class UpdateCoursesErrorState extends AppStates {
  final String error;
  UpdateCoursesErrorState(this.error);
}

class GetCourseByIDLoadingState extends AppStates {}

class GetCourseByIDSuccessState extends AppStates {
  final Map<String,dynamic> courseByID;
  GetCourseByIDSuccessState(this.courseByID);
}

class GetCourseByIDErrorState extends AppStates {
  final String error;
  GetCourseByIDErrorState(this.error);
}*/

class DeleteAdvisorLoadingState extends AppStates {}

class DeleteAdvisorSuccessState extends AppStates {
  final dynamic responce;
  DeleteAdvisorSuccessState(this.responce);
}

class DeleteAdvisorErrorState extends AppStates {
  final String error;
  DeleteAdvisorErrorState(this.error);
}


class EditRecProcControllLoadingState extends AppStates {}

class EditRecProcControllSuccessState extends AppStates {
  final dynamic responce;
  EditRecProcControllSuccessState(this.responce);
}

class EditRecProcControllErrorState extends AppStates {
  final String error;
  EditRecProcControllErrorState(this.error);
}

class CurrentCoursesForAdminLoadingState extends AppStates {}

class CurrentCoursesForAdminSuccessState extends AppStates {
  final dynamic responce;
  CurrentCoursesForAdminSuccessState(this.responce);
}

class CurrentCoursesForAdminErrorState extends AppStates {
  final String error;
  CurrentCoursesForAdminErrorState(this.error);
}

class InsertDegreesLoadingState extends AppStates {}

class InsertDegreesSuccessState extends AppStates {
  final dynamic responce;
  InsertDegreesSuccessState(this.responce);
}

class InsertDegreesErrorState extends AppStates {
  final String error;
  InsertDegreesErrorState(this.error);
}

