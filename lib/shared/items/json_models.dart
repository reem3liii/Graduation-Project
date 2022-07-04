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