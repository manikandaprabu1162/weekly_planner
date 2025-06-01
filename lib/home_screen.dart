import 'package:flutter/material.dart';
import 'day_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for demonstration
    final List<Map<String, dynamic>> sampleTasks = [
      {
        'day': 'Monday',
        'task': 'Buy groceries',
        'details': 'Milk, Eggs, Bread',
      },
      {'day': 'Tuesday', 'task': 'Meeting', 'details': 'Project sync at 10am'},
      {'day': 'Wednesday', 'task': 'Workout', 'details': 'Gym at 6pm'},
    ];
    return ListView.builder(
      itemCount: sampleTasks.length,
      itemBuilder: (context, index) {
        final task = sampleTasks[index];
        return ListTile(
          leading: const Icon(Icons.event_note, color: Colors.deepPurple),
          title: Text(task['task']),
          subtitle: Text(task['day']),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DayDetailsScreen(
                  day: task['day'],
                  task: task['task'],
                  details: task['details'],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
