import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saas/shared/styles/colors.dart';

class BoardingModel {
  String image;
  String title;
  String body;
  BoardingModel({required this.image, required this.title, required this.body});
}

class PerformanceData {
  PerformanceData(this.semester, this.gpa);

  final String semester;
  final double gpa;
}

class CurrentCourses{
  String courseName;
  String courseCode;
  String courseProfessor;
  String courseAbbreviation;
  Color color;
  CurrentCourses({
    required this.courseName,
    required this.courseCode,
    required this.courseProfessor,
    required this.courseAbbreviation,
    required this.color,
  });
}

List<CurrentCourses> courses = [
  CurrentCourses(
      courseName: "Mobile Application Development",
      courseCode: "CSC402",
      courseProfessor: "Abdelrahman Yasser",
      courseAbbreviation: "MAD",
      color: defaultBlueColor,
  ),
  CurrentCourses(
    courseName: "Compiler Design",
    courseCode: "CSC206",
    courseProfessor: "Ahmed Mostafa",
    courseAbbreviation: "CD",
    color: defaultGreenColor,
  ),
  CurrentCourses(
    courseName: "Machine Learning",
    courseCode: "CSC405",
    courseProfessor: "Mohamed Ali",
    courseAbbreviation: "ML",
    color: defaultOrangeColor,
  ),
  CurrentCourses(
    courseName: "Parallel Programming",
    courseCode: "CSC304",
    courseProfessor: "Mohamed Fekry",
    courseAbbreviation: "PP",
    color: defaultGreenColor,
  ),
  CurrentCourses(
    courseName: "Artificial Intelligence",
    courseCode: "CSC301",
    courseProfessor: "Ahmed Fouad",
    courseAbbreviation: "AI",
    color: defaultPinkColor,
  ),
  CurrentCourses(
    courseName: "Software Engineering II",
    courseCode: "SEN202",
    courseProfessor: "Amira Ahmed",
    courseAbbreviation: "SE II",
    color: defaultBlueColor,
  ),
];

List<PerformanceData> performancedata = [
  PerformanceData('1st', 3.1),
  PerformanceData('2nd', 2.2),
  PerformanceData('3rd', 3.1),
  PerformanceData('4th', 2.7),
  PerformanceData('5th', 2.9),
];