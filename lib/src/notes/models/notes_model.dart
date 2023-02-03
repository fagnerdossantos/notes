// ignore_for_file: public_member_api_docs, sort_constructors_first
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
}
