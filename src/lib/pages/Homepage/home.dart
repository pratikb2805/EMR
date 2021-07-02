import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';
import 'package:emr/pages/pages.dart';

class EMRApp extends StatefulWidget {
  final signInStatus;
  EMRApp({required this.signInStatus});
  _EMRAppState createState() => _EMRAppState();
}

class _EMRAppState extends State<EMRApp> {
  int curId = 0;
  late bool status;
  @override
  void initState() {
    super.initState();
    status = widget.signInStatus;
    curId = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Fluent.FluentApp(
        debugShowCheckedModeBanner: false,
        theme: Fluent.ThemeData(
            typography: Fluent.Typography(
              title: TextStyle(
                fontSize: 36,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            brightness: Fluent.Brightness.light,
            visualDensity: Fluent.VisualDensity.adaptivePlatformDensity,
            accentColor: SystemTheme.accentInstance.accent.toAccentColor()),
        title: 'EMR',
        home: status ? SignIn() : SignUpForm());
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curId = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Fluent.NavigationView(
        pane: Fluent.NavigationPane(
            selected: curId,
            onChanged: (i) => setState(() {
                  curId = i;
                }),
            items: [
              Fluent.PaneItem(
                  icon: Icon(FluentIcons.home_20_regular),
                  title: Text('Dashboard')),
              Fluent.PaneItem(
                  icon: Icon(FluentIcons.calendar_assistant_20_regular),
                  title: Text('Appointments')),
              Fluent.PaneItem(
                  icon: Icon(FluentIcons.person_24_regular),
                  title: Text('Patients')),
              Fluent.PaneItem(
                  icon: Icon(FluentIcons.storage_24_regular),
                  title: Text('Store'))
            ],
            displayMode: Fluent.PaneDisplayMode.compact),
        content: Fluent.NavigationBody(
          animationCurve: Fluent.standartCurve,
          index: curId,
          children: [
            DoctorDashboards(
              patientsOnPressed: () {
                setState(() {
                  this.curId = 2;
                });
              },
              appointMentOnpresed: () {
                setState(() {
                  this.curId = 1;
                });
              },
            ),
            AppointmentList(),
            PatientList(),
            MedicineListEntityList()
          ],
        ),
      ),
    );
  }
}
