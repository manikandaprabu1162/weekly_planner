import 'package:hive/hive.dart';
import '../models/task.dart';

class LocalStorageService {
  static const String taskBoxName = 'tasks';

  static Future<void> init() async {
    Hive.registerAdapter(TaskAdapter());
    await Hive.openBox<Task>(taskBoxName);
  }

  static Box<Task> get taskBox => Hive.box<Task>(taskBoxName);

  static List<Task> getAllTasks() {
    return taskBox.values.toList();
  }

  static Future<void> addTask(Task task) async {
    await taskBox.put(task.id, task);
  }

  static Future<void> updateTask(Task task) async {
    await task.save();
  }

  static Future<void> deleteTask(String id) async {
    await taskBox.delete(id);
  }
}
