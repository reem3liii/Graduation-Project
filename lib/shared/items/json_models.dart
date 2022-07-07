class Advisor {
  String? id;
  String? fullName;
  String? email;
  int? level;
  String? phone;

  Advisor({this.id, this.fullName, this.email, this.level, this.phone});

  Advisor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    level = json['level'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['level'] = this.level;
    data['phone'] = this.phone;
    return data;
  }
}

class Student {
  String? id;
  String? fullName;
  String? email;
  int? level;
  String? phone;

  Student({this.id, this.fullName, this.email, this.level, this.phone});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    level = json['level'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['level'] = this.level;
    data['phone'] = this.phone;
    return data;
  }
}

class Course {
  String? instructorName;
  String? courseName;
  String? courseCode;
  String? level;

  Course({this.instructorName, this.courseName, this.courseCode, this.level});

  Course.fromJson(Map<String, dynamic> json) {
    instructorName = json['instructorName'];
    courseName = json['courseName'];
    courseCode = json['courseCode'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['instructorName'] = this.instructorName;
    data['courseName'] = this.courseName;
    data['courseCode'] = this.courseCode;
    data['level'] = this.level;
    return data;
  }
}

class addUser {
  String? status;
  String? message;

  addUser({this.status, this.message});

  addUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }

}


//student models

class SemesterAndGrade{
  String? semesterName;
  double? gpAofSemester;

  SemesterAndGrade({
    this.semesterName,
    this.gpAofSemester
  });

  SemesterAndGrade.fromJson( Map<String,dynamic> json){
    semesterName = json['semesterName'];
    gpAofSemester = json['gpAofSemester'];
  }

  Map<String , dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['semesterName'] = semesterName;
    data['gpAofSemester'] = gpAofSemester;
    return data;
  }
}
List<SemesterAndGrade> semestersAndGrades = [];


class CurrentCourse {
  String? instructorName;
  String? courseName;
  String? courseCode;

  CurrentCourse({this.instructorName, this.courseName, this.courseCode});

  CurrentCourse.fromJson(Map<String, dynamic> json) {
    instructorName = json['instructorName'];
    courseName = json['courseName'];
    courseCode = json['courseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['instructorName'] = this.instructorName;
    data['courseName'] = this.courseName;
    data['courseCode'] = this.courseCode;
    return data;
  }
}

List<CurrentCourse> currentCourses = [];

class TotalHoursAndGpa {
  double? gpa;
  int? hours;

  TotalHoursAndGpa({this.gpa, this.hours});

  TotalHoursAndGpa.fromJson(Map<String, dynamic> json) {
    gpa = json['gpa'];
    hours = json['hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gpa'] = this.gpa;
    data['hours'] = this.hours;
    return data;
  }
}

int totalHours=0;
double totalGpa=0;

class CoursesOnSemester {
  double? gpa;
  String? courseName;

  CoursesOnSemester({this.gpa, this.courseName});

  CoursesOnSemester.fromJson(Map<String, dynamic> json) {
    gpa = json['gpa'];
    courseName = json['courseName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gpa'] = this.gpa;
    data['courseName'] = this.courseName;
    return data;
  }
}

List<dynamic> courses_Semester = [];

