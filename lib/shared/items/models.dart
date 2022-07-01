import 'package:flutter/material.dart';
import 'package:saas/shared/design/colors.dart';

class BoardingModel {
  String image;
  String title;
  String body;
  String arTitle;
  String arBody;
  BoardingModel(
      {required this.image,
      required this.title,
      required this.body,
      required this.arTitle,
      required this.arBody});
}

class PerformanceData {
  PerformanceData(this.semester, this.gpa);

  final String semester;
  final double gpa;
}

class CurrentCourses {
  String courseName;
  String arCourseName;
  String courseCode;
  String courseProfessor;
  String arCourseProfessor;
  String courseAbbreviation;
  Color color;
  CurrentCourses({
    required this.courseName,
    required this.arCourseName,
    required this.courseCode,
    required this.courseProfessor,
    required this.arCourseProfessor,
    required this.courseAbbreviation,
    required this.color,
  });
}

List<CurrentCourses> courses = [
  CurrentCourses(
    courseName: "Mobile Application Development",
    arCourseName: "تطوير تطبيقات الهاتف",
    courseCode: "CSC402",
    courseProfessor: "Abdelrahman Yasser",
    arCourseProfessor: "عبدالرحمن ياسر",
    courseAbbreviation: "MAD",
    color: defaultBlueColor,
  ),
  CurrentCourses(
    courseName: "Compiler Design",
    courseCode: "CSC206",
    courseProfessor: "Ahmed Mostafa",
    courseAbbreviation: "CD",
    color: defaultGreenColor,
    arCourseName: 'تصميم المترجمات',
    arCourseProfessor: 'أحمد مصطفى',
  ),
  CurrentCourses(
    courseName: "Machine Learning",
    courseCode: "CSC405",
    courseProfessor: "Mohamed Ali",
    courseAbbreviation: "ML",
    color: defaultOrangeColor,
    arCourseName: 'التعلم الآلي',
    arCourseProfessor: 'محمد علي',
  ),
  CurrentCourses(
    courseName: "Parallel Programming",
    courseCode: "CSC304",
    courseProfessor: "Mohamed Fekry",
    courseAbbreviation: "PP",
    color: defaultGreenColor,
    arCourseName: 'برمجة متوازية',
    arCourseProfessor: 'محمد فكري',
  ),
  CurrentCourses(
    courseName: "Artificial Intelligence",
    courseCode: "CSC301",
    courseProfessor: "Ahmed Fouad",
    courseAbbreviation: "AI",
    color: defaultPinkColor,
    arCourseName: 'الذكاء الاصطناعي',
    arCourseProfessor: 'أحمد فؤاد',
  ),
  CurrentCourses(
    courseName: "Software Engineering II",
    courseCode: "SEN202",
    courseProfessor: "Amira Ahmed",
    courseAbbreviation: "SE II",
    color: defaultBlueColor,
    arCourseName: 'هندسة البرمجيات II',
    arCourseProfessor: 'أمير أحمد',
  ),
];

List<PerformanceData> performancedata = [
  PerformanceData('1st', 3.1),
  PerformanceData('2nd', 2.2),
  PerformanceData('3rd', 3.1),
  PerformanceData('4th', 2.7),
  PerformanceData('5th', 2.9),
];

class CurrentUser {
  String? message;
  String? status;
  UserLogin? userLogin;

  CurrentUser({this.message, this.status, this.userLogin});

  CurrentUser.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    userLogin = json['userLogin'] != null
        ? new UserLogin.fromJson(json['userLogin'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.userLogin != null) {
      data['userLogin'] = this.userLogin!.toJson();
    }
    return data;
  }
}

class UserLogin {
  String? id;
  String? username;
  String? email;
  List<String>? roles;
  String? token;

  UserLogin({this.id, this.username, this.email, this.roles, this.token});

  UserLogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    roles = json['roles'].cast<String>();
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['roles'] = this.roles;
    data['token'] = this.token;
    return data;
  }
}
