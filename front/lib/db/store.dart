import 'package:emr/db/patient.dart';
import 'package:emr/objectbox.g.dart';
import 'dart:io';

class ViewModel {
  final Store _store;
  late final Box<Appointment> _appointmentBox;
  late final Box<Patient> _patientBox;
  late final Stream<Query<Appointment>> queryAppointmentStream;
  late final Stream<Query<Patient>> _queryPatientStream;

  ViewModel(Directory dir)
      : _store = Store(
          getObjectBoxModel(),
          directory: dir.path + '/objectbox',
        ) {
    _appointmentBox = Box<Appointment>(_store);
    final qAppointmentBuilder = _appointmentBox.query()
      ..order(Appointment_.start, flags: Order.descending);
    queryAppointmentStream =
        qAppointmentBuilder.watch(triggerImmediately: true);

    _patientBox = Box<Patient>(_store);
    final qPatientBuilder = _patientBox.query()
      ..order(Patient_.name, flags: Order.descending);
    _queryPatientStream = qPatientBuilder.watch(triggerImmediately: true);
  }

  void addAppointment(Appointment appointment) =>
      _appointmentBox.put(appointment);

  void removeAppointment(Appointment appointment) =>
      _appointmentBox.remove(appointment.id);

  void addPatient(Patient patient) => _patientBox.put(patient);

  void dispose() {
    _store.close();
  }
}
