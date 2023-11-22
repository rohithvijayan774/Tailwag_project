class ReminderModel {
  String reminderid;
  String reminderDate;
  String reminderTime;
  String reminderTitle;
  String reminderDescription;

  ReminderModel({
    required this.reminderid,
    required this.reminderDate,
    required this.reminderTime,
    required this.reminderTitle,
    required this.reminderDescription,
  });

  factory ReminderModel.fromMap(Map<String, dynamic> map) {
    return ReminderModel(
      reminderid: map['reminderid'],
      reminderDate: map['reminderDate'],
      reminderTime: map['reminderTime'],
      reminderTitle: map['reminderTitle'],
      reminderDescription: map['reminderDescription'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reminderid': reminderid,
      'reminderDate': reminderDate,
      'reminderTime': reminderTime,
      'reminderTitle': reminderTitle,
      'reminderDescription': reminderDescription,
    };
  }
}
