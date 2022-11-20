class NotesModel {
  final String id;
  String note;
  String color;
  String time;
  NotesModel({
    required this.id,
    required this.note,
    required this.color,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'note': note});
    result.addAll({'color': color});
    result.addAll({'time': time});

    return result;
  }

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      id: map['id'] ?? '',
      note: map['note'] ?? '',
      color: map['color'] ?? '',
      time: map['time'] ?? '',
    );
  }
}
