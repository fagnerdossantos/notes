// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoteModel {
  final int? id;
  final String title;
  final String note;
  final String date;
  final String hour;

  NoteModel({
    this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.hour,
  });

  NoteModel copyWith({
    int? id,
    String? title,
    String? note,
    String? date,
    String? hour,
  }) {
    return NoteModel(
      id: id,
      title: title ?? this.title,
      note: note ?? this.note,
      date: date ?? this.date,
      hour: hour ?? this.hour,
    );
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] as int?,
      title: map['title'] as String,
      note: map['note'] as String,
      date: map['date'] as String,
      hour: map['hour'] as String,
    );
  }

  @override
  String toString() {
    return 'NoteModel(id: $id, title: $title, note: $note, date: $date, hour: $hour)';
  }
}
