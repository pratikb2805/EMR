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
import 'utils/util.dart';

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
  final dir = (await getApplicationSupportDirectory()).path;
  //ignore camelcase
  final DB_DIR = p.join(dir, 'objectbox');
  print(DB_DIR);
  createReportDir();
  bool signInStaus = await Doctor.isSignedUp();
  // Widget child = signInStaus ? SignIn() : SignUpForm();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MedicineModel(DB_DIR)),
    ChangeNotifierProvider(create: (_) => AppointmentModel(DB_DIR)),
    ChangeNotifierProvider(
      create: (_) => PatientModel(DB_DIR),
    )
  ], child: EMRApp(signInStatus: signInStaus)));
  doWhenWindowReady(() {
    final win = appWindow;
    win.minSize = Size(600, 600);
    // win.size = Size(800, 800);
    // win.alignment = Alignment.center;
    win.title = 'Electronic Medical Records';

    win.show();
  });
}
