class IdTime {
  int _id = 0;
  final List<String> _timeList = [];

  int get id => _id;
  List<String> get time => _timeList;

  void generateId() => _id++;

  void generateTime() {
    final time = DateTime.now();

    final String date = "${time.day}-${time.month}-${time.year}";
    final String hour = "${time.hour}:${time.minute}:${time.second}";

    _timeList.addAll([date, hour]);
  }
}
