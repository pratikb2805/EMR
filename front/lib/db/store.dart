import 'package:emr/db/patient.dart';
import 'package:emr/objectbox.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class AppointmentModel extends ChangeNotifier {
  final Store _store;
  late final Box<Appointment> _appointmentBox;
  late final Stream<Query<Appointment>> queryAppointmentStream;

  AppointmentModel()
      : _store = Store(
          getObjectBoxModel(),
          directory:
              r'C:\Users\Pratik Bedre\AppData\Roaming\com.example\front\objectbox',
          maxReaders: 3,
        ) {
    _appointmentBox = Box<Appointment>(_store);
    final qAppointmentBuilder = _appointmentBox.query()
      ..order(Appointment_.start, flags: Order.descending);
    queryAppointmentStream =
        qAppointmentBuilder.watch(triggerImmediately: true);
  }

  void addAppointment(Appointment appointment) {
    _appointmentBox.put(appointment);
    notifyListeners();
  }

  Appointment? getAppointment(String id) => _appointmentBox.get(int.parse(id));

  void removeAppointment(Appointment appointment) {
    _appointmentBox.remove(appointment.id);
    notifyListeners();
  }

  List<Appointment> getAll() {
    return _appointmentBox.getAll();
  }

  get count => _appointmentBox.count();

  void dispose() {
    _store.close();
  }
}

class PatientModel extends ChangeNotifier {
  final Store _store;
  late final Box<Patient> _patientBox;
  late final Stream<Query<Patient>> queryPatientStream;
  var _qPatientBuilder;
  PatientModel()
      : _store = Store(
          getObjectBoxModel(),
          directory:
              r'C:\Users\Pratik Bedre\AppData\Roaming\com.example\front\objectbox',
          maxReaders: 3,
        ) {
    // print(p.join(dir.path, 'objectbox'));
    _patientBox = _store.box<Patient>();
    // _patientBox = Box<Patient>(_store);
    _qPatientBuilder = _patientBox.query()
      ..order(Patient_.name, flags: Order.descending);
    queryPatientStream = _qPatientBuilder.watch(triggerImmediately: true);
  }
  // get
  get count => _patientBox.count();
  void removePatient(Patient patient) {
    _patientBox.remove(patient.id);
    notifyListeners();
  }

  List<Patient> getTop() {
    return _patientBox
        .getAll()
        .getRange(0, min(5, _patientBox.count()))
        .toList();
  }

  List<Patient> getAll() {
    return _patientBox.getAll();
  }

  Patient? getPatient(String id) => _patientBox.get(int.parse(id));

  void addPatient(Patient patient) {
    _patientBox.put(patient);
    notifyListeners();
  }

  void dispose() {
    _store.close();
  }
}
