import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.calendar_month, size: 80, color: Colors.deepPurple),
          SizedBox(height: 16),
          Text(
            'Calendar',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('A calendar view will be shown here.'),
        ],
      ),
    );
  }
}
