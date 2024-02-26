import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Widgets/no_reservations.dart';
import 'package:resto_run_mobile/Widgets/reservations_list.dart';
import 'MakeReservation.dart';
import 'package:resto_run_mobile/Models/reservation.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';

class MyReservations extends StatefulWidget {
  @override
  _MyReservationsState createState() => _MyReservationsState();
}

class _MyReservationsState extends State<MyReservations> {
  int currentIndex = 0;
  // The list of reservations can stay here

  // This would usually be fetched from a database or API
  //final List<Reservation> reservations = []; // Example reservations list

  // Create a mock list of reservations for demonstration
  final List<Reservation> reservations = [
    Reservation(
      location: 'SB CMT8',
      tableSize: '2',
      dateTime: DateTime.now().add(Duration(days: 1)), // Future reservation
    ),
    Reservation(
      location: 'SB Han Thuyen',
      tableSize: '4',
      dateTime: DateTime.now().subtract(Duration(days: 1)), // Past reservation
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
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MakeReservation()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green, // Example color, replace with your choice
      )
          : null, // Don't show the FAB when there are no reservations

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => setState(() => currentIndex = index),
        selectedIconTheme: const IconThemeData(color: AppColors.lightGreen),

        unselectedIconTheme:
        const IconThemeData(color: AppColors.unselectedNavItem),

        selectedLabelStyle: const TextStyle(
            color: AppColors.lightGreen,
            fontSize: 14,
            fontWeight: FontWeight.bold),

        unselectedLabelStyle: const TextStyle(
            color: AppColors.unselectedNavItem,
            fontSize: 10,
            fontWeight: FontWeight.bold),
        currentIndex: currentIndex,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourite",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "QR"),

          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),

          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notification"),
        ],
      ),
    );
  }
}
