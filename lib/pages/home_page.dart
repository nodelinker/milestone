import 'package:flutter/material.dart';
import 'package:milestone/widget/bottom_sheet.dart';
import 'package:milestone/widget/custom_calendar.dart';
import 'package:milestone/widget/custom_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildShowModalBottomSheet(context, null);
        },
        child: Icon(Icons.add),
      ),
      // appBar: AppBar(
      //   title: Text('Material App Bar'),
      // ),
      body: Container(
        color: Colors.teal,
        child: SafeArea(
            child: Container(
                child: CustomCalendarWidget())),
      ),
    );
  }
}
