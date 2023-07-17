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
}
