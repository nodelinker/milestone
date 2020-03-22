

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:milestone_app/models/tasks_model.dart';

class TaskViewModel extends ChangeNotifier{

  List<TaskModel> events = List<TaskModel>();
  Map<String, List<dynamic>> tasks = Map<String, List<dynamic>>();


  void addTask(DateTime datetime, TaskModel task){

    // debugPrint("========> ${task.taskName}, ${task.taskDesc}");

    String dtFmt = DateFormat('yyyy-MM-dd').format(datetime);

    List selectedEvents = tasks[dtFmt] ?? [];
    selectedEvents.add(task);
    tasks[dtFmt] = selectedEvents;

    selectedEvents.forEach((elems) => {
      debugPrint("aa => ${elems.taskName}, ${elems.taskDesc}")
    });

    // tasks[datetime].add(task);
    notifyListeners();
  }

}