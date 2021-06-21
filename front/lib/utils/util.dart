import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class DoctorInfoManager extends Object {
  static final _hashAgent = Hmac(sha256, utf8.encode('ThisKeyIsSecret'));
  static Future<void> setPassword(String password) async {
    var encodedBytes = utf8.encode(password);
    var hashStream = _hashAgent.convert(encodedBytes);

    var instance = await SharedPreferences.getInstance();
    await instance.setString('password', hashStream.toString());
  }

  static Future<bool> verifyPassword(String password) async {
    var instance = await SharedPreferences.getInstance();
    String? hash = instance.getString('password');
    if (hash == null) {
      throw 'Password not found';
    }
    var encodedBytes = utf8.encode(password);
    var hashStream = _hashAgent.convert(encodedBytes);

    return hash == hashStream.toString();
  }

  static Future<bool> isUserSignedIn() async {
    var instance = await SharedPreferences.getInstance();
    return instance.getBool('signInStaus') ?? false;
  }

  static Future<DateTime>? lastSignIn() async {
    var instance = await SharedPreferences.getInstance();
    String timeStamp = instance.getString('lastSignIN') ?? '';
    return DateTime.parse(timeStamp);
  }

  static Future<String> getUserName() async {
    var instance = await SharedPreferences.getInstance();
    return instance.getString('username') ?? '';
  }

  static Future<void> setUserName(String username) async {
    var instance = await SharedPreferences.getInstance();
    await instance.setString('username', username);
  }
}

class Doctor {
  String name;
  List<String>? qualifications;
  DateTime? dateJoined;
  String? address;
  String? photo;
  String email;
  String phone;
  Doctor(
      {required this.name,
      this.address,
      this.qualifications,
      required this.email,
      required this.phone}) {
    if (dateJoined == null) {
      dateJoined = DateTime.now();
    }
  }
  Doctor.fromJson(Map<String, dynamic> mp)
      : name = mp['name'],
        address = mp['address'] ?? '',
        email = mp['email'],
        qualifications = mp['qual'].toString().split(','),
        phone = mp['phone'];
}
