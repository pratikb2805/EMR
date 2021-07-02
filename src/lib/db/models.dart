import 'package:objectbox/objectbox.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

@Entity()
class Patient {
  int id = 0;
  String name;
  String? address;
  String email;
  String phone;
  int age;
  @Property(type: PropertyType.date)
  DateTime dateFirstConsult;
  @Property(type: PropertyType.date)
  DateTime dateMostRecentConsult;
  String diagnosis;
  String dirPath;
  @Backlink()
  final prescription = ToMany<Prescription>();
  @Backlink()
  final appointments = ToMany<Appointment>();
  @Backlink()
  final files = ToMany<PatientFile>();
  @Backlink()
  final prescriptions = ToMany<Prescription>();

  void addFile(String filePath, String name) {
    File(filePath).copySync(path.join(dirPath, name));

    files.add(new PatientFile(name: name, path: path.join(dirPath, name)));
  }

  Patient(
      {required this.name,
      this.address,
      required this.diagnosis,
      required this.age,
      required this.dateFirstConsult,
      required this.dateMostRecentConsult,
      required this.email,
      required this.phone,
      this.dirPath = ''}) {
    prepareStorage();
  }

  void prepareStorage() async {
    Directory base = await getApplicationSupportDirectory();
    dirPath = path.join(path.join(base.path, 'patientFiles'), '$id');
    if (!Directory(dirPath).existsSync()) Directory(dirPath).createSync();
  }

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
      age: json['age'] != null ? int.parse(json['age']) : 0,
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
  var patienttoFile = ToOne<Patient>();
  PatientFile({required this.name, required this.path, this.description});
}

@Entity()
class Appointment {
  int id = 0;
  ToOne<Patient> patient = ToOne<Patient>();
  String name;
  String phone;
  String email;
  @Property(type: PropertyType.date)
  DateTime start;
  @Property(type: PropertyType.date)
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
  int quantity;

  void increse() => quantity++;
  void decrease() => quantity--;
  ToOne<Prescription> prescription = ToOne<Prescription>();

  Medicine({required this.name, required this.quantity});
}

@Entity()
class MedicineListEntity {
  int id = 0;
  String name;
  String provider;
  String type;
  MedicineListEntity(
      {required this.name, this.provider = '', this.type = 'Tablet'});
}
// @Entity()
// class PrescriptionEntity {
//   int id = 0;
//   ToOne<Prescription> prescription = ToOne<Prescription>();
//   ToOne<Medicine> medicine = ToOne<Medicine>();
//   int quantity = 0;
//   PrescriptionEntity({required this.quantity});
// }

@Entity()
class Prescription {
  int id = 0;
  Prescription({required this.date, required this.filePath});
  final patient = ToOne<Patient>();
  final String filePath;
  final DateTime date;
  @Backlink()
  ToMany<Medicine> medicines = ToMany<Medicine>();
}
