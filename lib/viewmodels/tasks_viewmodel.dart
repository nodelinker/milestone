

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:milestone_app/models/tasks_model.dart';

class TaskViewModel extends ChangeNotifier{

  List<TaskModel> events = List<TaskModel>();
  Map<DateTime, List<dynamic>> tasks = Map<DateTime, List<dynamic>>();


  void addTask(DateTime datetime, TaskModel task){

    // debugPrint("========> ${task.taskName}, ${task.taskDesc}");

    String dtFmtstr = DateFormat('yyyy-MM-dd').format(datetime);
    DateTime date = DateTime.parse(dtFmtstr);

    List selectedEvents = tasks[date] ?? [];
    selectedEvents.add(task);
    tasks[date] = selectedEvents;

    selectedEvents.forEach((elems) => {
      debugPrint("aa => ${elems.taskName}, ${elems.taskDesc}")
    });

    notifyListeners();
  }

  List<dynamic> getTasks(DateTime datetime){

    String dtFmtstr = DateFormat('yyyy-MM-dd').format(datetime);
    DateTime date = DateTime.parse(dtFmtstr);
    return tasks[date] ?? [];

  }

  void setTaskState(DateTime datetime, String taskId, bool state){

    String dtFmtstr = DateFormat('yyyy-MM-dd').format(datetime);
    DateTime date = DateTime.parse(dtFmtstr);
    List selectedEvents = tasks[date] ?? [];

    debugPrint("aa => $taskId");
    TaskModel task = selectedEvents.firstWhere((item) => item.taskID == taskId, orElse: null);
    if (task != null){
      task.isDone = state;
    }
    

    notifyListeners();
  }

}