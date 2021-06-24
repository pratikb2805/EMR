import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'pages/pages.dart';
import 'package:system_theme/system_theme.dart';

// import 'package:desktop_window/desktop_window.dart';

int main() {
  // await DesktopWindow.setMinWindowSize(Size(600, 600));
  runApp(MyApp());
  return 0;
}

class MyApp extends Fluent.StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends Fluent.State<MyApp> {
  int curId = 0;
  @override
  void initState() {
    // TODO: implement initState
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
                  icon: Icon(FluentIcons.person_24_regular),
                  title: Text('Dashboard'))
            ],
            displayMode: Fluent.PaneDisplayMode.compact),
        content: Fluent.NavigationBody(
          index: curId,
          children: [
            DoctorDashboards(),
          ],
        ),
      ),
    );
  }
}
