enum ReservationStatus { accepted, cancelled, pending, past }

class Reservation {
  final String location;
  final String tableSize;
  final DateTime dateTime;
  final ReservationStatus status;

  Reservation({
    required this.location,
    required this.tableSize,
    required this.dateTime,
    this.status = ReservationStatus.pending,
  });

  bool get isPast => dateTime.isBefore(DateTime.now());
}
