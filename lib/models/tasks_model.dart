

class TaskModel{

  String taskID;
  String taskName;
  String taskDesc;
  DateTime datetime;


  TaskModel({this.taskID, this.taskName, this.taskDesc, this.datetime});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskID: json["task_id"],
      taskName: json["task_name"], 
      taskDesc: json["task_desc"],
      datetime: json["datetime"]
    );
  }

}
