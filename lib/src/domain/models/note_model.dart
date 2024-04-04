// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../database/objectbox.g.dart' show Entity;

@Entity()
class NoteModel {
  int? id;

  String title;
  String note;
  int color;
  bool favorite;
  DateTime time;

  NoteModel({
    this.id = 0,
    required this.title,
    required this.note,
    required this.color,
    required this.favorite,
    required this.time,
  });

  NoteModel copyWith({
    int? id,
    String? title,
    String? note,
    int? color,
    bool? favorite,
    DateTime? time,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      color: color ?? this.color,
      favorite: favorite ?? this.favorite,
      time: time ?? this.time,
    );
  }
}
