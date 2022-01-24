import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:my_todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    // Example Task:
    // Task(name: 'Buy Milk'),
    // Task(name: 'Buy Eggs'),
    // Task(name: 'Buy Bread'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
