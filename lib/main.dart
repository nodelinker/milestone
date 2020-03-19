import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:milestone_app/widget/bottom_sheet.dart';
import 'package:milestone_app/widget/custom_calendar.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'new app',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildShowModalBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
      // appBar: AppBar(
      //   title: Text('Material App Bar'),
      // ),
      body: Container(
        color: Colors.teal,
        child: SafeArea(child: Container(child: CustomCalendarWidget())),
      ),
    );
  }
}