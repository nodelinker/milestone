import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();

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
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
        locale: 'zh_CN',

        calendarController: _calendarController,
        startingDayOfWeek: StartingDayOfWeek.monday,
        onDaySelected: _onDaySelected,
        onVisibleDaysChanged: _onVisibleDaysChanged,

        events: null,
        holidays: null,

        headerVisible: false, // 不显示calendar header
        initialCalendarFormat: CalendarFormat.month,
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
          selectedDayBuilder: _selectedDayBuilder, //selected day
          todayDayBuilder: _todayDayBuilder, // day of today
          outsideDayBuilder: _outsideDayBuilder,
          outsideWeekendDayBuilder:
              _outsideWeekendDayBuilder, // show the month ouside day is weekend
          markersBuilder: _markersBuilder,
        ),
      ),
    );
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

  Widget _selectedDayBuilder(context, date, _) {
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
