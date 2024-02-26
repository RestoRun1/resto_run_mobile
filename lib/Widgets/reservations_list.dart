import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Models/reservation.dart';
import 'package:resto_run_mobile/Pages/ReservationDetailPage.dart';

class ReservationsListWidget extends StatelessWidget {
  final List<Reservation> reservations;

  ReservationsListWidget({required this.reservations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return Card(
            child: ListTile(
              title: Text(reservation.location),
              subtitle: Text('Table for ${reservation.tableSize}'),
              trailing: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ReservationDetailPage(reservation: reservation),
                    ),
                  );
                },
                child: Text('View Details'),
              ),
            ),
          );
        }
    );
  }
}
