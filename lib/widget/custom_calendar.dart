import 'package:flutter/material.dart';
import 'package:milestone_app/viewmodels/tasks_viewmodel.dart';
import 'package:milestone_app/widget/bottom_sheet.dart';
import 'package:milestone_app/widget/checkbox_list_tile.dart';
import 'package:milestone_app/widget/spark_line.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'custom_calendar_cell.dart';

class CustomCalendarWidget extends StatefulWidget {
  CustomCalendarWidget({Key key}) : super(key: key);

  @override
  _CustomCalendarWidgetState createState() => _CustomCalendarWidgetState();
}

class _CustomCalendarWidgetState extends State<CustomCalendarWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;
  TaskViewModel _taskList;
  DateTime _calendarSelectedDay;
  bool _donotShowSparkLine;

  @override
  void initState() {
    super.initState();

    _donotShowSparkLine = false;

    _calendarSelectedDay = DateTime.now();

    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');

    setState(() {
      _calendarSelectedDay = day;
    });
    _animationController.forward(from: 0.2);
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    debugPrint('CALLBACK: _onVisibleDaysChangedb $first, $last, $format');
    if (CalendarFormat.month == format) {
      setState(() {
        _donotShowSparkLine = true;
      });
    } else {
      setState(() {
        _donotShowSparkLine = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _taskList = Provider.of<TaskViewModel>(context);

    return Column(
      children: <Widget>[
        // Container(
        //   padding: EdgeInsets.only(left: 25.0, right:25.0),
        //   child: CustomPaint(
        //     size: Size(MediaQuery.of(context).size.width,
        //         MediaQuery.of(context).size.height / 6),
        //     painter: TopLinePaint(),
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(
                  // color: Colors.blue,
                  splashColor: Colors.teal[300],
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.reorder,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Todo List",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 60,
                  child: FlatButton(
                    splashColor: Colors.teal[300],
                    onPressed: () {},
                    child: Stack(
                      children: <Widget>[
                        Icon(
                          Icons.archive,
                          color: Colors.white,
                          size: 25,
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: FlatButton(
                    // color: Colors.blue,
                    splashColor: Colors.teal[300],
                    onPressed: () {},
                    child: Icon(
                      Icons.cloud_off,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: FlatButton(
                    // color: Colors.blue,
                    splashColor: Colors.teal[300],
                    onPressed: () {},
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Offstage(
          offstage: _donotShowSparkLine,
          child: AnimatedOpacity(
            opacity: _donotShowSparkLine ? 0.0 : 1.0,
            duration: Duration(milliseconds: 700),
            child: Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
              child: MySparkline(
                data: [0.0, 1, 5, 0.0, 0.0, 0.0, 0.0],
                fallbackHeight: 30.0,
                lineWidth: 3,
                lineColor: Colors.white,
                pointsMode: PointsMode.all,
                pointSize: 8.0,
                pointColor: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: TableCalendar(
            locale: 'zh_CN',

            calendarController: _calendarController,
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: _onDaySelected,
            onVisibleDaysChanged: _onVisibleDaysChanged,

            events: _taskList.tasks,
            holidays: null,

            headerVisible: false, // 不显示calendar header
            initialCalendarFormat: CalendarFormat.week,
            formatAnimation: FormatAnimation.scale,
            availableGestures: AvailableGestures.all,

            availableCalendarFormats: const {
              CalendarFormat.month: '',
              CalendarFormat.week: '',
            },

            calendarStyle: CalendarStyle(
              outsideDaysVisible: true,
              weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
              holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
              outsideStyle: TextStyle().copyWith(color: Colors.grey[400]),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle().copyWith(color: Colors.grey),
              weekdayStyle: TextStyle().copyWith(color: Colors.grey),
            ),
            headerStyle: HeaderStyle(
              // centerHeaderTitle: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(fontSize: 20.0, color: Colors.white),
            ),

            builders: CalendarBuilders(
              dayBuilder: _dayBuilder, // every day
              selectedDayBuilder: _calendarSelectedDayBuilder, //selected day
              todayDayBuilder: _todayDayBuilder, // day of today
              outsideDayBuilder: _outsideDayBuilder,
              outsideWeekendDayBuilder:
                  _outsideWeekendDayBuilder, // show the month ouside day is weekend
              markersBuilder: _markersBuilder,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: Container(
            color: Colors.white,
            child:_taskList.isEmpty(_calendarSelectedDay)  ?  _buildTaskList(): _showEmptyPanel(),
          ),
        ),
      ],
    );
  }

  Widget _showEmptyPanel() {
    return Container(
      child: Center(
          child: Icon(
        Icons.settings_input_antenna,
        size: 128,
        color: Colors.grey[200],
      )),
    );
  }

  Widget _buildTaskList() {
    return ListView(
      children: _taskList
          .getTasks(_calendarSelectedDay)
          .map((task) => Container(
                decoration: BoxDecoration(
                  // border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),

                // child: Container(
                //   child: Column(
                //     children: [
                //       Row(
                //         children: <Widget>[
                //           Checkbox(value: task.isDone, onChanged: (value){
                //             _taskList.setTaskState(_calendarSelectedDay, task.taskID, value);
                //           }),
                //           Text("${task.taskName}", style: Theme.of(context).textTheme.body1,)
                //       ],)

                //     ]
                //   ),
                // ),

                // checkbox listTile
                child: Dismissible(
                  key: Key(task.taskID),
                  background: Container(color: Colors.red),

                  direction: DismissDirection.endToStart,
                  dismissThresholds: {
                    DismissDirection.startToEnd: 0.2,
                    DismissDirection.endToStart: 0.5
                  },
                  secondaryBackground:
                      Container(color: Colors.red, child: Icon(Icons.cancel)),
                  // confirmDismiss: (direction){
                  //   if (DismissDirection.endToStart == direction){
                  //     print('dismiss $direction');
                  //     _taskList.deleteTask(_calendarSelectedDay, task);
                  //     Scaffold.of(context).showSnackBar(SnackBar(content: Text("${task.taskName} dismissed")));
                  //   }
                  // },
                  // onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final bool res = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirm"),
                          content: const Text(
                              "Are you sure you wish to delete this item?"),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text("DELETE")),
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("CANCEL"),
                            ),
                          ],
                        );
                      },
                    );

                    if (res == true) {
                      _taskList.deleteTask(_calendarSelectedDay, task);
                    }
                    return res;
                  },

                  child: MyCheckboxListTile(
                    value: task.isDone,
                    onChanged: (value) {
                      debugPrint("========== ${task.taskID} ${task.taskName}");
                      _taskList.setTaskState(
                          _calendarSelectedDay, task.taskID, value);
                    },
                    title: new Text(
                      '${task.taskName}',
                      style: _taskNameStyle(task.isDone),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    subtitle: new Text('${task.taskDesc}'),
                    secondary: new Icon(Icons.archive),
                    activeColor: Colors.red,
                    onTap: () {
                      debugPrint(
                          "tap ========== ${task.taskID} ${task.taskName} ${task.datetime}");

                      buildShowModalBottomSheet(context, task);
                    },
                  ),
                ),

                // listTile show description
                // child: ListTile(
                //   title: Text(task.taskName),
                //   onTap: () => print('$task tapped!'),
                // ),
              ))
          .toList(),
    );
  }

  TextStyle _taskNameStyle(bool isDone) {
    if (isDone) {
      return TextStyle(decoration: TextDecoration.lineThrough);
    } else {
      return null;
    }
  }

  List<Widget> _markersBuilder(context, date, events, holidays) {
    final children = <Widget>[];

    if (events.isNotEmpty) {
      children.add(
        Positioned(
          right: 1,
          bottom: 1,
          child: _buildEventsMarker(date, events),
        ),
      );
    }

    if (holidays.isNotEmpty) {
      children.add(
        Positioned(
          right: -2,
          top: -2,
          child: _buildHolidaysMarker(),
        ),
      );
    }

    return children;
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _outsideWeekendDayBuilder(context, date, _) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.only(top: 5.0, left: 6.0),
      // color: Colors.amber[400],
      width: 100,
      height: 100,
      child: CalendarDayWidget(
        datetime: date,
        textStyle: TextStyle(color: Colors.grey[400]),
      ),
    );
  }

  Widget _outsideDayBuilder(context, date, _) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.only(top: 5.0, left: 6.0),
      // color: Colors.amber[400],
      width: 100,
      height: 100,
      child: CalendarDayWidget(
        datetime: date,
        textStyle: TextStyle(color: Colors.grey[400]),
      ),
    );
  }

  Widget _todayDayBuilder(context, date, _) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.only(top: 5.0, left: 6.0),
      color: Colors.amber[400],
      width: 100,
      height: 100,
      child: CalendarDayWidget(
        datetime: date,
        textStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _calendarSelectedDayBuilder(context, date, _) {
    return FadeTransition(
      opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
      child: Container(
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.only(top: 5.0, left: 6.0),
        color: Colors.deepOrange[300],
        width: 100,
        height: 100,
        child: CalendarDayWidget(
          datetime: date,
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // generate every day
  Widget _dayBuilder(context, date, _) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.only(top: 5.0, left: 6.0),
      child: CalendarDayWidget(
        datetime: date,
        textStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
