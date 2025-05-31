import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/local_storage_service.dart';
import 'package:uuid/uuid.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskProvider() {
    loadTasks();
  }

  Future<void> loadTasks() async {
    _tasks = LocalStorageService.getAllTasks();
    notifyListeners();
  }

  Future<void> addTask(
    String title,
    String description,
    DateTime date,
    DateTime time,
  ) async {
    final task = Task(
      id: const Uuid().v4(),
      title: title,
      description: description,
      date: date,
      time: time,
    );
    await LocalStorageService.addTask(task);
    _tasks.add(task);
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    await LocalStorageService.updateTask(task);
    notifyListeners();
  }

  Future<void> deleteTask(String id) async {
    await LocalStorageService.deleteTask(id);
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  List<Task> tasksForDate(DateTime date) {
    return _tasks
        .where(
          (t) =>
              t.date.year == date.year &&
              t.date.month == date.month &&
              t.date.day == date.day,
        )
        .toList();
  }
}
