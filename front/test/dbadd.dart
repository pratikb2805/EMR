import 'package:emr/objectbox.g.dart';
// import 'D:/EMR/front/assets/data/appointment.json' as data;
import 'dart:convert';
import 'package:path/path.dart' as p;
import 'package:emr/db/patient.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() async {
  print((await getApplicationSupportDirectory()).path);
  // final store = Store(getObjectBoxModel(),
  //     directory: p.join(r'D:\\Projects\\flutter\\EMR\\front', 'objectbox'));
  // final appointmentBox = store.box<Appointment>();
  // appointmentBox.removeAll();
  // var data = json.decode(
  //     File(r"D:\Projects\flutter\EMR\front\assets\data\appointment.json")
  //         .readAsStringSync());
  // print(data[0].runtimeType);
  // for (Map<String, dynamic> dt in data) {
  //   print(dt['name']);
  //   // dt['id'] = 0;
  //   appointmentBox.put(Appointment.fromJson(dt));
  // }
  // for (var i in appointmentBox.getAll()) print(i.id);

  // final patientBox = store.box<Patient>();
  // patientBox.removeAll();
  // var data2 = json.decode(
  //     File(r"D:\Projects\flutter\EMR\front\assets\data\patient.json")
  //         .readAsStringSync());
  // print(data2[0].runtimeType);
  // for (Map<String, dynamic> dt in data2) {
  //   print(dt['name']);
  //   // dt['id'] = 0;
  //   patientBox.put(Patient.fromJson(dt));
  // }
  // for (var i in patientBox.getAll()) print(i.id);
  // store.close();
}
