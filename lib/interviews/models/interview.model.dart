class Interview {
  String id;
  String title;
  String description;
  DateTime date;
  String postulationId;
  String status;

  Interview.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      description = json['description'],
      date = json['date'],
      postulationId = json['postulationId'],
      status = json['status'];
}