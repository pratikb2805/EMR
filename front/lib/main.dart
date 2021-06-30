import 'package:emr/db/store.dart';
import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';
import 'pages/pages.dart';
// import 'package:system_theme/system_theme.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter_acrylic/flutter_acrylic.dart' as FlutterAcrylic;
import 'package:provider/provider.dart';

// import 'package:desktop_window/desktop_window.dart';
void createReportDir() async {
  String loc = (await getApplicationSupportDirectory()).path;
  String finalDir = p.join(loc, 'patientfiles');
  var dir = Directory(finalDir);
  bool dirExists = await dir.exists();
  if (dirExists) {
    print(finalDir);
    print("Exist");
  } else {
    dir.create(recursive: true);
    print("Created the Directory");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterAcrylic.Acrylic.initialize();

  createReportDir();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppointmentModel()),
    ChangeNotifierProvider(
      create: (context) => PatientModel(),
    )
  ], child: MyApp()));
  doWhenWindowReady(() {
    final win = appWindow;
    win.minSize = Size(600, 600);
    // win.size = Size(800, 800);
    // win.alignment = Alignment.center;
    win.title = 'Electronic Medical Records';

    win.show();
  });
}

class MyApp extends Fluent.StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends Fluent.State<MyApp> {
  final PatientModel patientModel = PatientModel();
  final AppointmentModel appointmentModel = AppointmentModel();
  int curId = 0;
  @override
  void initState() {
    super.initState();
    curId = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Fluent.FluentApp(
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
      // theme: themeData,
      title: 'EMR',
      home: Fluent.NavigationView(
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
                  title: Text('Patients'))
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
            PatientList()
          ],
        ),
      ),
    );
  }
}
