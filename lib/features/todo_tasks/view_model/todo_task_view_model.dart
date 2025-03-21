import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:todo_task/features/todo_tasks/model/todo_task_model.dart';

class TodoTaskViewModel extends ChangeNotifier {
  String? _priority;
  String? get priority => _priority;
  
  void setPriority(String value) {
    _priority = value;
    notifyListeners();
  }

  List<String> priorityList = ["Alto", "Médio", "Baixo"];
  String selectedPriority = 'Alto';

  void selectPriority(String value){
    selectedPriority = value;
    notifyListeners();
  }

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