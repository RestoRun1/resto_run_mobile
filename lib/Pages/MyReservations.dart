import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Widgets/no_reservations.dart';
import 'package:resto_run_mobile/Widgets/reservations_list.dart';
import 'MakeReservation.dart';
import 'package:resto_run_mobile/Models/reservation.dart';

class MyReservations extends StatelessWidget {
  // This would usually be fetched from a database or API
  //final List<Reservation> reservations = []; // Example reservations list

  // Create a mock list of reservations for demonstration
  final List<Reservation> reservations = [
    Reservation(
      location: 'SB CMT8',
      tableSize: '2',
      dateTime: DateTime.now().add(Duration(days: 1)), // Future reservation
      isCancelled: false,
    ),
    Reservation(
      location: 'SB Han Thuyen',
      tableSize: '4',
      dateTime: DateTime.now().subtract(Duration(days: 1)), // Past reservation
      isCancelled: true,
    ),
    // Add more mock reservations if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('My Reservations', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // TODO: Implement more options
            },
          ),
        ],
      ),
      body: reservations.isEmpty
          ? NoReservationsWidget() // Show this when there are no reservations
          : ReservationsListWidget(reservations: reservations), // Show this when there are reservations
      floatingActionButton: reservations.isNotEmpty
          ? FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to the reservation creation page
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green, // Example color, replace with your choice
      )
          : null, // Don't show the FAB when there are no reservations
    );
  }
}
