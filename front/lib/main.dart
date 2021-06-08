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

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  var _selectedIndex = 0;

  Widget getSelected() {
    switch (_selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return AppointmentList();
      case 2:
        return PatientsList();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(
                  Icons.home,
                ),
                label: Text(
                  "Home",
                ),
              ),
              NavigationRailDestination(
                icon: const Icon(
                  Icons.calendar_today_outlined,
                ),
                selectedIcon: const Icon(Icons.calendar_today_rounded),
                label: Text(
                  "Appointments",
                ),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.person_outline),
                selectedIcon: const Icon(Icons.person),
                label: Text(
                  "Patients",
                ),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
              child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 20.0,
                  color: Colors.amber,
                ),
                Expanded(
                    child: Container(
                  color: Colors.blue,
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
