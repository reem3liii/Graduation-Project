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
    gpa = (json['gpa']as num).toDouble();
    hours = json['hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gpa'] = this.gpa;
    data['hours'] = this.hours;
    return data;
  }
}

var totalHours = 0;
double totalGpa = 0;

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


class CurrentUserData {
  String? name;
  String? nameArb;
  String? gender;
  String? brithOfdate;
  String? acceptenceYear;
  String? department;
  String? city;
  String? address;
  String? phoneNumber;
  String? email;
  String? previousqualification;
  String? institute;
  int? graduationYear;
  int? total;
  int? percentage;

  CurrentUserData(
      {this.name,
        this.nameArb,
        this.gender,
        this.brithOfdate,
        this.acceptenceYear,
        this.department,
        this.city,
        this.address,
        this.phoneNumber,
        this.email,
        this.previousqualification,
        this.institute,
        this.graduationYear,
        this.total,
        this.percentage});

  CurrentUserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameArb = json['nameArb'];
    gender = json['gender'];
    brithOfdate = json['brithOfdate'];
    acceptenceYear = json['acceptenceYear'];
    department = json['department'];
    city = json['city'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    previousqualification = json['previousqualification'];
    institute = json['institute'];
    graduationYear = json['graduationYear'];
    total = json['total'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['nameArb'] = this.nameArb;
    data['gender'] = this.gender;
    data['brithOfdate'] = this.brithOfdate;
    data['acceptenceYear'] = this.acceptenceYear;
    data['department'] = this.department;
    data['city'] = this.city;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['previousqualification'] = this.previousqualification;
    data['institute'] = this.institute;
    data['graduationYear'] = this.graduationYear;
    data['total'] = this.total;
    data['percentage'] = this.percentage;
    return data;
  }
}
CurrentUserData? currentUserInf;
List userInformation = [];
String token ='';
