import 'package:emr/objectbox.g.dart';
// import 'D:/EMR/front/assets/data/appointment.json' as data;
import 'dart:convert';
import 'package:path/path.dart' as p;
import 'package:emr/db/patient.dart';
import 'dart:io';

void main() async {
  final store = Store(getObjectBoxModel(),
      directory: p.join(
          r'C:\Users\Pratik Bedre\AppData\Roaming\com.example\front',
          'objectbox'));
  final patientBox = store.box<Appointment>();
  patientBox.removeAll();
  var data = json.decode(
      File(r"D:\EMR\front\assets\data\appointment.json").readAsStringSync());
  print(data[0].runtimeType);
  for (Map<String, dynamic> dt in data) {
    print(dt['name']);
    // dt['id'] = 0;
    patientBox.put(Appointment.fromJson(dt));
  }
  for (var i in patientBox.getAll()) print(i.id);
  store.close();
}
