
import 'package:flutter/material.dart';


class CustomCalendarEvent extends StatelessWidget {

  final DateTime datetime;
  final List events;
  final bool isSelected;
  final bool isToday;
  final double height;
  final double width;
  
  const CustomCalendarEvent({Key key, this.datetime, this.events, this.isSelected, this.isToday, this.height=16, this.width=16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: isSelected
            ? Colors.brown[500]
            : isToday
                ? Colors.brown[300]
                : Colors.blue[400],
      ),
      width: width,
      height: height,
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
}