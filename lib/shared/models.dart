import 'package:flutter/material.dart';
import 'package:saas/shared/colors.dart';

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
