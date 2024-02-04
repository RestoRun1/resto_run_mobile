// lib/pages/reservation_detail_page.dart

import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Models/reservation.dart'; // Update this with the correct import path

class ReservationDetailPage extends StatelessWidget {
  final Reservation reservation;

  ReservationDetailPage({required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation Detail'),
      ),
      body: Column(
        children: <Widget>[
          // Display different information based on the reservation status
          if (reservation.status == ReservationStatus.accepted) ...[
            // Widgets for accepted reservation
          ] else if (reservation.status == ReservationStatus.cancelled) ...[
            // Widgets for cancelled reservation
          ] else if (reservation.status == ReservationStatus.pending) ...[
            // Widgets for pending reservation
          ],
        ],
      ),
    );
  }
}
