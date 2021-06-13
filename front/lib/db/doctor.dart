import 'package:objectbox/objectbox.dart';

@Entity()
class Doctor {
  String? name;
  List<String>? qualifications;
  DateTime? dateJoined;
  String? address;
  String email;
  String phone;
  Doctor(
      {this.name,
      this.address,
      this.dateJoined,
      required this.email,
      required this.phone});
}
