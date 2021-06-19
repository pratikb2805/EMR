import 'package:flutter/material.dart';
import 'pages/pages.dart';
// import 'package:desktop_window/desktop_window.dart';

int main() {
  // await DesktopWindow.setMinWindowSize(Size(600, 600));
  runApp(MyApp());
  return 0;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
        primaryColor: Colors.purple,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 32,
              height: 44,
              color: Colors.black,
              letterSpacing: -0.05,
              fontWeight: FontWeight.w600),
          headline4: TextStyle(
              fontSize: 20,
              height: 27,
              fontFamily: 'Open Sans',
              color: Colors.black,
              letterSpacing: 0.002,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600),
          headline3: TextStyle(
              fontSize: 24,
              fontFamily: 'Open Sans',
              height: 33,
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontWeight: FontWeight.w600),
          headline2: TextStyle(
              fontSize: 32,
              fontFamily: 'Open Sans',
              height: 44,
              color: Colors.black,
              letterSpacing: -0.05,
              fontWeight: FontWeight.w600),
          headline5: TextStyle(
              fontSize: 16,
              fontFamily: 'Open Sans',
              height: 22,
              fontStyle: FontStyle.normal,
              color: Colors.black,
              letterSpacing: -0.05,
              fontWeight: FontWeight.w600),
        ));
    return MaterialApp(
      theme: themeData,
      color: Colors.white,
      title: 'EMR',
      home: SignUpForm(),
    );
  }
}
