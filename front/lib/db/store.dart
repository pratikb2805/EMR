import 'package:emr/db/patient.dart';
import 'package:emr/objectbox.g.dart';
import 'dart:io';

class AppointmentModel {
  final Store _store;
  late final Box<Appointment> _appointmentBox;
  late final Stream<Query<Appointment>> queryAppointmentStream;

  AppointmentModel()
      : _store = Store(
          getObjectBoxModel(),
          directory: Directory('D:\\Projects\\flutter\\EMR\\front').path +
              '/objectbox',
          maxReaders: 3,
        ) {
    _appointmentBox = Box<Appointment>(_store);
    final qAppointmentBuilder = _appointmentBox.query()
      ..order(Appointment_.start, flags: Order.descending);
    queryAppointmentStream =
        qAppointmentBuilder.watch(triggerImmediately: true);
  }

  void addAppointment(Appointment appointment) =>
      _appointmentBox.put(appointment);

  Appointment? getAppointment(String id) => _appointmentBox.get(int.parse(id));

  void removeAppointment(Appointment appointment) =>
      _appointmentBox.remove(appointment.id);

  void dispose() {
    _store.close();
  }
}

class PatientModel {
  final Store _store;
  late final Box<Patient> _patientBox;
  late final Stream<Query<Patient>> queryPatientStream;

  PatientModel()
      : _store = Store(
          getObjectBoxModel(),
          directory: Directory('D:\\Projects\\flutter\\EMR\\front').path +
              '/objectbox',
          maxReaders: 3,
        ) {
    _patientBox = Box<Patient>(_store);
    final qPatientBuilder = _patientBox.query()
      ..order(Patient_.name, flags: Order.descending);
    queryPatientStream = qPatientBuilder.watch(triggerImmediately: true);
  }

  void removePatient(Patient patient) => _patientBox.remove(patient.id);

  Patient? getPatient(String id) => _patientBox.get(int.parse(id));

  void addPatient(Patient patient) => _patientBox.put(patient);

  void dispose() {
    _store.close();
  }
}
