import 'package:emr/pages/userProfile.dart';
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
        home: BodyWidget());
  }
}

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

enum WidgetMarker { home, appointments, patients }

class _BodyWidgetState extends State<BodyWidget> {
  WidgetMarker _selectedWidget = WidgetMarker.home;
  Widget getSelected() {
    switch (_selectedWidget) {
      case WidgetMarker.home:
        return HomePage();
      case WidgetMarker.appointments:
        return AppointmentList();
      case WidgetMarker.patients:
        return PatientsList();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HI"),
        ),
        drawer: MediaQuery.of(context).size.width < 600
            ? Drawer(
                child: NavBarFull(),
              )
            : null,
        body: MediaQuery.of(context).size.width < 600
            ? getSelected()
            : SafeArea(
                child: Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    child: NavBarFull(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 200,
                    child: getSelected(),
                  )
                ],
              )));
  }
}

class NavBarFull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      TextButton(
          onPressed: () {
            //widget._selectedWidget = WidgetMarker.patients;
          },
          child: ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text("Home"),
          )),
      TextButton(
          onPressed: () {
            //widget._selectedWidget = WidgetMarker.appointments;
          },
          child: ListTile(
            leading: Icon(Icons.calendar_today_outlined),
            title: Text("Appointments"),
            selectedTileColor: Colors.blue.shade300,
          )),
      TextButton(
          onPressed: () {
            //widget._selectedWidget = WidgetMarker.patients;
          },
          child: ListTile(
            leading: Icon(Icons.person_outline),
            title: Text("Patients"),
          ))
    ]);
  }
}

class NavBarShort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
