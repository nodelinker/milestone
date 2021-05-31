import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:milestone/pages/home_page.dart';
import 'package:milestone/viewmodels/tasks_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'new app',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: Colors.teal,
          accentColor: Colors.teal,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.purple)),
        ),
        home: MyHomePage(),
      ), 
      providers: [
        ChangeNotifierProvider(create: (_) => TaskViewModel(),),
      ],
    );
  }
}

