import 'package:flutter/material.dart';
import 'package:milestone_app/models/custom_colors.dart';
import 'package:milestone_app/models/tasks_model.dart';
import 'package:milestone_app/viewmodels/tasks_viewmodel.dart';
import 'package:provider/provider.dart';

Future buildShowModalBottomSheet(BuildContext context) {

  DateTime pickedDate = DateTime.now();
  TaskModel task = TaskModel();
  final taskList = Provider.of<TaskViewModel>(context, listen: false);

  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: Column(
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: TextField(
                  //     // decoration: InputDecoration(
                  //     //   hintText: "要做点什么"
                  //     // ),
                  //     decoration: InputDecoration.collapsed(
                  //       hintText: "要做点什么",
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.all(10.0),
                  //   decoration: BoxDecoration(
                  //     color: Colors.tealAccent,
                  //     borderRadius: BorderRadius.all(Radius.circular(32)),
                  //   ),
                  //   child: TextField(
                  //     decoration: new InputDecoration(
                  //         suffixIcon: IconButton(
                  //           onPressed: () {},
                  //           icon: Icon(Icons.add),
                  //         ),
                  //         border: InputBorder.none,
                  //         focusedBorder: InputBorder.none,
                  //         contentPadding: EdgeInsets.only(
                  //             left: 15, bottom: 11, top: 11, right: 15),
                  //         hintText: '想要做点什么2？'),
                  //   ),
                  // ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      FlatButton(onPressed: () {
                        
                        debugPrint("picked datetime : $pickedDate");
                        taskList.addTask(pickedDate, task);

                        Navigator.pop(context);


                      }, child: Text("添加任务")),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: TextField(
                          onChanged: (value){
                            task.taskName = value;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "准备做什么"),
                        ),
                      ))
                    ],
                  ),

                  Row(textDirection: TextDirection.rtl, children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        onChanged: (value){
                          task.taskDesc = value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "任务描述",
                          hintStyle:
                              TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ),
                    ))
                  ]),

                  Divider(
                    height: 1.0,
                    color: Colors.red,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: RaisedButton(
                          shape: StadiumBorder(),
                          color: Colors.blue,
                          splashColor: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {},
                          child: Text("今天"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: RaisedButton(
                          shape: StadiumBorder(),
                          color: Colors.blue,
                          splashColor: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {},
                          child: Text("明天"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: RaisedButton(
                          shape: StadiumBorder(),
                          color: Colors.blue,
                          splashColor: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () async {
                            pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1970),
                              lastDate: DateTime(2070),
                            );
                          },
                          child: Text("选择日期"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),

                  Text("$pickedDate"),
                  selectGadgetList(context),
                  // Row(
                  //   textDirection: TextDirection.rtl,
                  //   children: <Widget>[
                  //     Expanded(
                  //       child: Padding(
                  //       padding: const EdgeInsets.only(left: 15.0),
                  //       child: TextField(
                  //         decoration: InputDecoration(
                  //             border: InputBorder.none, hintText: "准备做什么"),
                  //       ),
                  //     ))
                  //   ],
                  // ),

                  // TextField(
                  //   decoration: InputDecoration(
                  //     hintText: "任务描述",
                  //     hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                  //     border: InputBorder.none
                  //   ),
                  // ),
                ],

              ),
            ),
          ),
        );
      });

}


 Container selectGadgetList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: CustomColors.GreyBorder,
          ),
          bottom: BorderSide(
            width: 1.0,
            color: CustomColors.GreyBorder,
          ),
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          Center(
            child: Row(
              children: <Widget>[
                Container(
                  height: 10.0,
                  width: 10.0,
                  margin: EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: CustomColors.YellowAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text('Personal'),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Text(
                'Work',
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: CustomColors.GreenIcon,
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreenShadow,
                    blurRadius: 5.0,
                    spreadRadius: 3.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Container(
                  height: 10.0,
                  width: 10.0,
                  margin: EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: CustomColors.PurpleIcon,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text('Meeting'),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Container(
                  height: 10.0,
                  width: 10.0,
                  margin: EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: CustomColors.BlueIcon,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text('Study'),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Container(
                  height: 10.0,
                  width: 10.0,
                  margin: EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: CustomColors.OrangeIcon,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text('Shopping'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }