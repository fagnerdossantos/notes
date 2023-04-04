class TimeClass {
  List<String> call() {
    final time = DateTime.now();

    final String date = "${time.day}-${time.month}-${time.year}";
    final String hour = "${time.hour}:${time.minute}:${time.second}";

    return [date, hour];
  }
}
