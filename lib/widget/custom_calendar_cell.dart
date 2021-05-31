import 'package:flutter/material.dart';
import 'package:milestone/models/date_model.dart';


class CalendarDayWidget extends StatelessWidget {
  final DateTime datetime;
  final bool disable;
  final TextStyle textStyle;

  const CalendarDayWidget({
    Key key,
    this.datetime,
    this.disable = false,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '${this.datetime.day}',
          style: textStyle,
        ),
        Text(
          '${DateModel.fromDateTime(this.datetime).lunarString}',
          style: textStyle,
        ),
      ],
    );
  }
}
