

class TaskModel{

  String taskName;
  String taskDesc;
  DateTime datetime;


  TaskModel({this.taskName, this.taskDesc, this.datetime});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskName: json["task_name"], 
      taskDesc: json["task_desc"],
      datetime: json["datetime"]
    );
  }

}
