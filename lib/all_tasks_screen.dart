import 'package:flutter/material.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.list, size: 80, color: Colors.deepPurple),
          SizedBox(height: 16),
          Text(
            'All Tasks',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('All your tasks will be listed here.'),
        ],
      ),
    );
  }
}
