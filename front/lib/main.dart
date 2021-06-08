import 'package:flutter/material.dart';
import 'pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.purple,
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))),
      title: 'EMR',
      home: PatientprofileWidget(),
    );
  }
}
