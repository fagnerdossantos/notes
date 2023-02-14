class NotesModel {
  final int id;
  String title;
  String notes;
  String date;
  String hour;

  NotesModel({
    required this.id,
    required this.title,
    required this.notes,
    required this.date,
    required this.hour,
  });

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      id: map['id'] as int,
      title: map['title'] as String,
      notes: map['notes'] as String,
      date: map['date'] as String,
      hour: map['hour'] as String,
    );
  }
}
