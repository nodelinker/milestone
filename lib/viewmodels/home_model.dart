


import 'package:flutter/foundation.dart';

class TaskModel{
  String taskName = "";
  DateTime taskTime;

  TaskModel({this.taskName});

  void setTaskName(value){
    this.taskName = value;
  }

}

class HomeViewModel extends ChangeNotifier{

  TaskModel task = TaskModel(taskName: "aaaaaaaaaaaaaaaaaa");

  void setTask(name){
    task.setTaskName(name);
    notifyListeners();
  }

}