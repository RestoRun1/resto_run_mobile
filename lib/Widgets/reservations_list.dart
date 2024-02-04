import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Models/reservation.dart';

class ReservationsListWidget extends StatelessWidget {
  final List<Reservation> reservations;

  ReservationsListWidget({required this.reservations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reservations.length,
      itemBuilder: (context, index) {
        final reservation = reservations[index];
        return ListTile(
          title: Text(reservation.location),
          subtitle: Text('Table for ${reservation.tableSize}'),
          trailing: Text(
            '${reservation.dateTime}',
            style: TextStyle(color: reservation.isPast ? Colors.red : Colors.green),
          ),
          // Additional details and buttons like Cancel and Contact support can be added here
        );
      },
    );
  }
}
