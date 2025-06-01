import 'package:flutter/material.dart';

class DayDetailsScreen extends StatelessWidget {
  final String day;
  final String task;
  final String details;
  const DayDetailsScreen({
    super.key,
    required this.day,
    required this.task,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$day Details')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task: $task',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Details: $details', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
