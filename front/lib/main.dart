import 'package:emr/pages/userProfile.dart';
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
    return MaterialApp(theme: themeData, title: 'EMR', home: BodyWidget());
  }
}

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

enum WidgetMarker { dashboard, appointments, patients }

class _BodyWidgetState extends State<BodyWidget> {
  WidgetMarker _selectedWidget = WidgetMarker.dashboard;
  Widget getSelected() {
    switch (_selectedWidget) {
      case WidgetMarker.dashboard:
        return DoctorDashboards();
      case WidgetMarker.appointments:
        return AppointmentList();
      case WidgetMarker.patients:
        return PatientsList();
      default:
        return DoctorDashboards();
    }
  }

  void refresh(dynamic _selected) {
    setState(() {
      _selectedWidget = _selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade50,
          title: Row(
            children: <Widget>[
              Container(
                child: Icon(Icons.hail),
              ),
              Container(color: Colors.black, child: Icon(Icons.ac_unit))
            ],
          ),
        ),
        drawer: MediaQuery.of(context).size.width < 600
            ? Drawer(
                child: new NavBarFull(notifyParent: refresh),
              )
            : null,
        body: MediaQuery.of(context).size.width < 600
            ? getSelected()
            : SafeArea(
                child: Row(
                children: <Widget>[
                  Container(
                    width: 210,
                    child: NavBarFull(notifyParent: refresh),
                  ),
                  VerticalDivider(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 220,
                    color: Colors.grey.shade100,
                    child: getSelected(),
                  )
                ],
              )));
  }
}

class NavBarFull extends StatefulWidget {
  final Function(dynamic _selected) notifyParent;
  NavBarFull({Key? key, required this.notifyParent}) : super(key: key);
  @override
  _NavBarFullState createState() => _NavBarFullState();
}

class _NavBarFullState extends State<NavBarFull> {
  WidgetMarker _selected = WidgetMarker.dashboard;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.only(top: 10, bottom: 10, left: 10))),
          onPressed: () {
            setState(() {
              _selected = WidgetMarker.dashboard;
            });
            widget.notifyParent(_selected);
            MediaQuery.of(context).size.width < 600
                ? Navigator.pop(context)
                : null;
          },
          child: ListTile(
            leading: _selected == WidgetMarker.dashboard
                ? Icon(Icons.home)
                : Icon(Icons.home_outlined),
            title: Text("Dashboard"),
            selected: _selected == WidgetMarker.dashboard,
            selectedTileColor: Colors.blue.shade100,
          )),
      TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.only(top: 10, bottom: 10, left: 10))),
          onPressed: () {
            setState(() {
              _selected = WidgetMarker.appointments;
            });
            widget.notifyParent(_selected);
            MediaQuery.of(context).size.width < 600
                ? Navigator.pop(context)
                : null;
          },
          child: ListTile(
            leading: _selected == WidgetMarker.appointments
                ? Icon(Icons.calendar_today)
                : Icon(Icons.calendar_today_outlined),
            title: Text(
              "Appointments",
            ),
            selected: _selected == WidgetMarker.appointments,
            selectedTileColor: Colors.blue.shade100,
          )),
      TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.only(top: 10, bottom: 10, left: 10))),
          onPressed: () {
            setState(() {
              _selected = WidgetMarker.patients;
            });
            widget.notifyParent(_selected);
            MediaQuery.of(context).size.width < 600
                ? Navigator.pop(context)
                : null;
            //widget._selectedWidget = WidgetMarker.patients;
          },
          child: ListTile(
            selected: _selected == WidgetMarker.patients,
            leading: _selected == WidgetMarker.patients
                ? Icon(Icons.person)
                : Icon(Icons.person_outlined),
            title: Text("Patients"),
            selectedTileColor: Colors.blue.shade100,
          ))
    ]);
  }
}
