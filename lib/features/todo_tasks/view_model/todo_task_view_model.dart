import 'package:flutter/widgets.dart';
import 'package:todo_task/features/todo_tasks/model/todo_task_model.dart';

class TodoTaskViewModel extends ChangeNotifier {
  Future<void> createTask(TodoTaskModel model) {
    notifyListeners();
    return Future.value();
  }

  getAllTask() {
    notifyListeners();
  }

  updateTask(TodoTaskModel model) {
    notifyListeners();
  }

  deleteTask(TodoTaskModel model) {
    notifyListeners();
  }
}