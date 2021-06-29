import 'package:objectbox/objectbox.dart';

@Entity()
class Patient {
  int id = 0;
  String name;
  String? address;
  String email;
  String phone;
  DateTime dateFirstConsult;
  DateTime dateMostRecentConsult;
  String diagnosis;

  Patient(
      {required this.name,
      this.address,
      required this.diagnosis,
      required this.dateFirstConsult,
      required this.dateMostRecentConsult,
      required this.email,
      required this.phone});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
      name: json['name'] as String,
      address: json['address'] != null ? json['address'] as String : '',
      email: json['email']! as String,
      dateFirstConsult: json['dateFirstConsult'] != null
          ? DateTime.parse(json['dateFirstConsult'] as String)
          : DateTime.now(),
      dateMostRecentConsult: json['dateMostRecentConsult'] != null
          ? DateTime.parse(json['dateMostRecentConsult'] as String)
          : DateTime.now(),
      phone: json['phone'] as String,
      diagnosis: json['diagnosis'] as String);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address ?? '',
        'email': email,
        'dateFirstConsult': dateFirstConsult,
        'dateMostRecentConsult': dateMostRecentConsult,
        'phone': phone
      };
}

@Entity()
class PatientFile {
  String name;
  int id = 0;
  String path;
  String? description;
  final patient = ToOne<Patient>();
  PatientFile({required this.name, required this.path, this.description});
}

@Entity()
class Appointment {
  int id = 0;
  ToOne<Patient> patient = ToOne<Patient>();
  String name;
  String phone;
  String email;
  DateTime start;
  DateTime end;
  String? description;
  Appointment(
      {required this.start,
      required this.email,
      required this.phone,
      required this.end,
      this.description,
      required this.name});

  Appointment.fromJson(Map<String, dynamic> json)
      : start = DateTime.parse(json['start']),
        name = json['name'],
        phone = json['phone'],
        email = json['email'],
        end = DateTime.parse(json['end']),
        description = json['description'];
  // patient = json['patient'] == null ? 0 : json['patient']['id'],
  // id = 0;

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
  int id = 0;
  ToOne<Patient> patient = ToOne<Patient>();
}
