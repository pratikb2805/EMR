import 'package:path_provider/path_provider.dart';
import 'package:emr/objectbox.g.dart';
import 'package:emr/db/models.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

void main() async {
  print((await getApplicationSupportDirectory()).path);
  var dir = await getApplicationSupportDirectory();
  final store =
      Store(getObjectBoxModel(), directory: p.join(dir.path, 'objectbox'));
  final appointmentBox = store.box<Appointment>();
  appointmentBox.removeAll();
  var data = json.decode(
      File(r"D:\EMR\front\assets\data\appointment.json").readAsStringSync());
  // print(data[0].runtimeType);
  for (Map<String, dynamic> dt in data) {
    print(dt['name']);
    // dt['id'] = 0;
    appointmentBox.put(Appointment.fromJson(dt));
  }
  for (var i in appointmentBox.getAll()) print(i.id);

  final patientBox = store.box<Patient>();
  patientBox.removeAll();
  var data2 = json.decode(
      File(r"D:\EMR\front\assets\data\patient.json").readAsStringSync());
  print(data2[0].runtimeType);
  for (Map<String, dynamic> dt in data2) {
    // print(dt['name']);
    // dt['id'] = 0;
    patientBox.put(Patient.fromJson(dt));
  }
  for (var i in patientBox.getAll()) print(i.id);
  store.close();
}
