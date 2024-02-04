import 'package:flutter/material.dart';
import 'ReviewInformationPage.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';

class MakeReservation extends StatefulWidget {
  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<MakeReservation> {
  int currentIndex = 0;
  int _numberOfAdults = 2;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay(hour: 12, minute: 0);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Find table'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/res1.png'),

            // Number of adults
            ListTile(
              title: Text('Number of Adults'),
              trailing: DropdownButton<int>(
                value: _numberOfAdults,
                icon: Icon(Icons.arrow_drop_down),
                onChanged: (int? newValue) { // Accepts a nullable int
                  if (newValue != null) { // Check for null
                    setState(() {
                      _numberOfAdults = newValue;
                    });
                  }
                },
                items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
            ),
            // Date Picker

            ListTile(
              title: Text('Date'),
              subtitle: Text("${_selectedDate.toLocal()}".split(' ')[0]),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),

            // Time Picker
            ListTile(
              title: Text('Time'),
              subtitle: Text(_selectedTime.format(context)),
              trailing: Icon(Icons.access_time),
              onTap: () => _selectTime(context),
            ),

            // Reserve Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightGreen
                ),
                child: Text('Reserve this table', style: TextStyle(color: AppColors.textGrey, fontSize: 14),),
                onPressed: () {
                  // Implement your booking logic

                  // After booking logic, navigate to the ReviewInformationPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReviewInformationPage()),
                  );
                },
              ),
            ),

            // Call Support Button
            TextButton(
              child: Text(('Call booking support'), style: TextStyle(color: AppColors.lightGreen, fontSize: 14),),
              onPressed: () {
                // Implement support call logic
              },

            ),
          ],
        ),
      ),

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
