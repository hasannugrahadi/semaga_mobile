class DateHelper{

  bool isToday(DateTime dateTime) {
    DateTime now = DateTime.now();
    return dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
  }

  bool isWithinOneWeek(DateTime dateTime) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime).abs();
    return difference.inDays <= 7 && now.weekday <= dateTime.weekday;
  }

  bool isWithinOneMonth(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime oneMonth = now.add(const Duration(days: 30));
    return dateTime.isBefore(oneMonth);
  }

}