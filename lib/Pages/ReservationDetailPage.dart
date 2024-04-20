// lib/pages/reservation_detail_page.dart

import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Models/reservation.dart'; // Update this with the correct import path
import 'package:resto_run_mobile/Widgets/ReservedWidget.dart';
import 'package:resto_run_mobile/Widgets/PastWidget.dart';
import 'package:resto_run_mobile/Widgets/CancelledWidget.dart';

class ReservationDetailPage extends StatelessWidget {
  final Reservation reservation;

  ReservationDetailPage({required this.reservation});

  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (reservation.status) {
      case ReservationStatus.accepted:
        content = ReservedWidget(reservation: reservation);
        break;
      case ReservationStatus.cancelled:
        content = CancelledWidget(reservation: reservation);
        break;
      case ReservationStatus.pending:
      // For pending, you mentioned no implementation is needed
      // But if you want to add something in the future, this is where it would go
        content = Container(); // Placeholder for now
        break;
      default:
      // Assuming any past reservation is neither accepted nor cancelled
        content = PastWidget(reservation: reservation);
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation Detail'),
      ),
      body: SingleChildScrollView(
        child: content,
      ),
    );
  }
}