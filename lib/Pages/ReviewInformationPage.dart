import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:resto_run_mobile/Color/AppColors.dart';

class ReviewInformationPage extends StatefulWidget {
  @override
  _ReviewInformationPageState createState() => _ReviewInformationPageState();
}

class _ReviewInformationPageState extends State<ReviewInformationPage> {

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _detailNotesController = TextEditingController();
  bool _smsReminder = false;
  int _elderlyCount = 0;
  int _childrenCount = 0;
  int currentIndex = 0;
  String _sittingArea = 'Any';
  Timer? _countdownTimer;
  int _remainingSeconds = 15; //5 * 60; // 5 minutes countdown

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _detailNotesController.dispose();
    super.dispose();
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        setState(() {
          timer.cancel();
          _showTimeOutDialog(); // Make sure this is called inside setState to refresh the UI
        });
      }
    });
  }

  void _showTimeOutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Oh no..."),
          content: Text("The table you have selected is released after 5 minutes of reviewing. Please kindly re-select the table."),
          actions: <Widget>[
            TextButton(
              child: Text("Re-select table"),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextFormField(TextEditingController controller, String label, String hint) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }

  Widget _buildCounter(String title, String subtitle, int count, Function(int) updateCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(subtitle),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => updateCount(max(0, count - 1)),
            ),
            Text('$count'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => updateCount(min(99, count + 1)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSMSReminderToggle() {
    return SwitchListTile(
      title: Text('SMS reminder'),
      value: _smsReminder,
      onChanged: (bool value) {
        setState(() {
          _smsReminder = value;
        });
      },
    );
  }

  Widget _buildSittingAreaSection() {
    var sittingOptions = ['Any', 'Inside', 'Outside'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sittingOptions.map((String option) {
        return RadioListTile<String>(
          title: Text(option),
          value: option,
          groupValue: _sittingArea,
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                _sittingArea = value;
              });
            }
          },
        );
      }).toList(),
    );
  }

  Widget _buildDetailNotes() {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                  labelText: 'Detail notes',
                  hintText: 'e.g proposal, anniversaries, birthdays, allergies...etc',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white),
              //controller: _controller,
              onSubmitted: (String value) {
                debugPrint(value);
              },
            )));

    /*return TextFormField(
      controller: _detailNotesController,
      maxLines: null,
      maxLength: 100,
      decoration: InputDecoration(
        labelText: 'Detail notes',
        hintText: 'e.g proposal, anniversaries, birthdays, allergies...etc',
        counterText: '${_detailNotesController.text.length}/100',
      ),
    );*/
  }

  Widget _buildButtonChild() {
    if (_remainingSeconds > 0) {
      int minutes = _remainingSeconds ~/ 60;
      int seconds = _remainingSeconds % 60;
      return Text('Book table (${minutes}:${seconds.toString().padLeft(2, '0')})', style: TextStyle(color: AppColors.textGrey, fontSize: 14),);
    } else {
      return Text('Re-select table');
    }
  }

  Widget _buildReservationInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('This table is reserved for you', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Time remaining: ${_formatTime(_remainingSeconds)}'),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SB CMT8', style: TextStyle(color: Colors.grey)),
                  Text('Table for 2', style: TextStyle(color: Colors.grey)),
                  Text('Today 14/02, 13:00', style: TextStyle(color: Colors.grey)),
                ],
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss the dialog
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Divider(),
          // ... include other reservation details ...
        ],
      ),
    );
  }

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: Text('Review Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildReservationInfo(),

              // Contact Info Form Fields
              _buildTextFormField(_fullNameController, 'Full name', 'E.g Nguyen Van A'),
              _buildTextFormField(_emailController, 'Email', 'E.g a.nguyen@tiki.vn'),
              _buildTextFormField(_phoneController, 'Phone number', '10-digit phone number'),

              // SMS Reminder
              _buildSMSReminderToggle(),

              // Notes Section
              _buildCounter('Elderly people', '60 years old & over', _elderlyCount,
                      (newCount) => setState(() => _elderlyCount = newCount)),
              _buildCounter('Children', '3 years and under', _childrenCount,
                      (newCount) => setState(() => _childrenCount = newCount)),

              // Sitting Area Section
              _buildSittingAreaSection(),

              // Detail Notes
              _buildDetailNotes(),

              // Button to Book Table or Re-select Table
              ElevatedButton(
                onPressed: _remainingSeconds > 0
                    ? () {
                  // TODO: Implement booking logic
                }
                    : null, // Disable button if timer has run out
                child: _buildButtonChild(),
              ),
            ],
          ),
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
