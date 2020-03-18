import 'package:flutter/material.dart';

class CustomCalendarHoliday extends StatelessWidget {
  const CustomCalendarHoliday({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.add_box,
        size: 20.0,
        color: Colors.blueGrey[800],
      ),
    );
  }
}
