import 'package:emr/db/models.dart';
import 'package:emr/objectbox.g.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class AppointmentModel extends ChangeNotifier {
  final Store _store;
  late final Box<Appointment> _appointmentBox;
  late final Stream<Query<Appointment>> queryAppointmentStream;

  AppointmentModel(String dir)
      : _store = Store(
          getObjectBoxModel(),
          directory: dir,
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
}

class PatientModel extends ChangeNotifier {
  final Store _store;
  late final Box<Patient> _patientBox;
  late final Stream<Query<Patient>> queryPatientStream;
  var _qPatientBuilder;
  PatientModel(String dir)
      : _store = Store(
          getObjectBoxModel(),
          directory: dir,
          maxReaders: 3,
        ) {
    print(dir);

    _patientBox = _store.box<Patient>();

    _qPatientBuilder = _patientBox.query()
      ..order(Patient_.name, flags: Order.descending);
    queryPatientStream = _qPatientBuilder.watch(triggerImmediately: true);
  }

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
}

class MedicineModel extends ChangeNotifier {
  final Store _store;
  late final Box<MedicineListEntity> _box;
  MedicineModel(String dir)
      : _store = Store(
          getObjectBoxModel(),
          directory: dir,
          maxReaders: 3,
        ) {
    _box = _store.box();
  }
  List<MedicineListEntity> get medicines => _box.getAll().toList();

  void addMedicine(MedicineListEntity med) {
    _box.put(med);
    notifyListeners();
  }

  void removeMedicine(MedicineListEntity med) {
    _box.remove(med.id);
    notifyListeners();
  }

  List<MedicineListEntity> suggestions(String str) {
    return _box
        .query(MedicineListEntity_.name.contains(str))
        .build()
        .find()
        .getRange(0, 10)
        .toList();
  }
}
