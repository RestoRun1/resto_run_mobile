import 'package:flutter/material.dart';

class NoReservationsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.restaurant_menu,
            size: 100,
            color: Colors.grey,
          ),
          Text(
            'You don\'t have any reservation yet',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          Text(
            'Do you want to reserve a table?',
            style: TextStyle(color: Colors.black54),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to reservation page
            },
            child: Text('Reserve a table'),
          ),
        ],
      ),
    );
  }
}
