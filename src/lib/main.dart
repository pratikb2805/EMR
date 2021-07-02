import 'package:flutter/material.dart';
import 'pages/pages.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter_acrylic/flutter_acrylic.dart' as FlutterAcrylic;
import 'package:provider/provider.dart';
import 'package:emr/db/db.dart';

void createReportDir() async {
  String baseDir = (await getApplicationSupportDirectory()).path;
  String finalDir = p.join(baseDir, 'patientfiles');
  Directory dir = Directory(finalDir);
  bool doesDirExists = await dir.exists();
  if (doesDirExists) {
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

  final DB_DIR = p.join(dir, 'objectbox');
  print(DB_DIR);
  createReportDir();
  bool signInStaus = await Doctor.isSignedUp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (create) => MedicineModel(DB_DIR)),
    ChangeNotifierProvider(create: (context) => AppointmentModel(DB_DIR)),
    ChangeNotifierProvider(
      create: (_) => PatientModel(DB_DIR),
    )
  ], child: EMRApp(signInStatus: signInStaus)));
  doWhenWindowReady(() {
    final win = appWindow;
    win.minSize = Size(600, 600);

    win.title = 'Electronic Medical Records';

    win.show();
  });
}
