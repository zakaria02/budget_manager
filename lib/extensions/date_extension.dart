extension DateTimeParing on DateTime {
  String stringDateTime() {
    return "${month.stringMonth()} $year";
  }
}

extension MonthParsing on int {
  String stringMonth() {
    List<String> months = [
      "JANUARY",
      "FEBRUARY",
      "MARCH",
      "APRIL",
      "MAY",
      "JUNE",
      "JULY",
      "AUGUST",
      "SEPTEMBER",
      "OCTOBER",
      "NOVEMBER",
      "DECEMBER",
    ];
    int index = this - 1;
    if (index >= 0 && index <= 11) {
      return months[index];
    } else {
      throw ("No month corresponds to $this");
    }
  }
}
