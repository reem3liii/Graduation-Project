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