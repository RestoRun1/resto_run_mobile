class Reservation {
  final String location;
  final String tableSize;
  final DateTime dateTime;
  final bool isCancelled;

  Reservation({
    required this.location,
    required this.tableSize,
    required this.dateTime,
    this.isCancelled = false,
  });

  bool get isPast => dateTime.isBefore(DateTime.now());
}
