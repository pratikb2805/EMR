import 'package:objectbox/objectbox.dart';

@Entity()
class Patient {
  int id = 0;
  String? name;
  String? address;
  String email;
  String phone;
  DateTime dateFirstConsult;
  DateTime dateMostRecentConsult;
  String diagnosis;

  Patient(
      {this.name,
      this.address,
      required this.diagnosis,
      required this.dateFirstConsult,
      required this.dateMostRecentConsult,
      required this.email,
      required this.phone});
}

@Entity()
class PatientFile {
  String name;
  String path;
  String? description;
  final patient = ToOne<Patient>();
  PatientFile({required this.name, required this.path, this.description});
}

@Entity()
class Appointment {
  ToOne<Patient>? patient = ToOne<Patient>();
  DateTime start;
  DateTime end;
  String? description;
  Appointment(
      {required this.start, required this.end, this.patient, this.description});
}

@Entity()
class Medicine {
  int id = 0;
  String name;
  String provider;
  Medicine({required this.name, required this.provider});
}

@Entity()
class PrescriptionEntity {
  int id = 0;
  final medicine = ToOne<Medicine>();
  int quantity;
  PrescriptionEntity({required this.quantity});
}

@Entity()
class Prescription {
  ToOne<Patient> patient = ToOne<Patient>();
}
