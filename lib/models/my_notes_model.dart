class MyNotesModel {
  String noteid;
  String date;
  String title;
  String description;

  MyNotesModel(
      {required this.noteid,
      required this.date,
      required this.title,
      required this.description});

  factory MyNotesModel.fromMap(Map<String, dynamic> map) {
    return MyNotesModel(
      noteid: map['noteid'],
      date: map['date'],
      title: map['title'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'noteid': noteid,
      'date': date,
      'title': title,
      'description': description,
    };
  }
}
