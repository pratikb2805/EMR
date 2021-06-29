import 'package:emr/objectbox.g.dart';
// import 'D:/EMR/front/assets/data/appointment.json' as data;
import 'dart:convert';
import 'package:emr/db/patient.dart';
import 'dart:io';

void main() {
  final store = Store(getObjectBoxModel());
  final appointmentBox = store.box<Appointment>();
  var data = json.decode(
      File(r"D:\EMR\front\assets\data\appointment.json").readAsStringSync());
  print(data[0].runtimeType);
  // for (Map<String, dynamic> dt in data) {
  //   print(dt);
  //   dt['id'] = 0;
  //   // break;
  //   appointmentBox.put(Appointment.fromJson(dt));
  // }
  for (var i in appointmentBox.getAll()) print(i.id);
  store.close();
}
