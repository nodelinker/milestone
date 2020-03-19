

import 'package:flutter/cupertino.dart';
import 'package:milestone_app/models/tasks_model.dart';

class TaskViewModel extends ChangeNotifier{

  Map<DateTime, List<TaskModel>> tasks;


  void addTask(DateTime datetime, TaskModel task){

    
    notifyListeners();
  }

}