class Patient {
  final int id;
  final String companyName;
  final String firstName;
  final String lastName;
  final String phone;

  const Patient(
      {required this.id,
      required this.companyName,
      required this.firstName,
      required this.lastName,
      required this.phone});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] as int,
      companyName: json['companyName'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'companyName': companyName,
  //     'firstName': firstName,
  //     'lastName': lastName,
  //     'phone': phone,
  //   };
  // }
}
