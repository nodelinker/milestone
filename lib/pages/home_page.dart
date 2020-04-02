import 'package:flutter/material.dart';
import 'package:milestone_app/widget/bottom_sheet.dart';
import 'package:milestone_app/widget/custom_calendar.dart';
import 'package:milestone_app/widget/custom_drawer.dart';

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
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false, 
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("home")),
            BottomNavigationBarItem(icon: Icon(Icons.alarm), title: Text("alarm")),
            BottomNavigationBarItem(icon: Icon(Icons.donut_large), title: Text("statistic")),
            BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("settings")),
          ]),
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
        child: SafeArea(child: Container(child: CustomCalendarWidget())),
      ),
    );
  }
}
