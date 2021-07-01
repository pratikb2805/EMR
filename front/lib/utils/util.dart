import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class Doctor {
  static final _hashAgent = Hmac(
      sha256,
      utf8.encode(
          'FBCB0E53F6C17984B561D52F36FBB655FEE711C339FCF0559FE7B9D941BF36AA'));

  String firstName, lastName, displayname;
  List<String>? qualifications;
  DateTime? dateJoined;
  String? address;
  String? photo;
  String email;
  String phone;
  String profileImage;
  Doctor(
      {required this.firstName,
      required this.lastName,
      required this.displayname,
      this.address,
      this.qualifications,
      required this.email,
      this.dateJoined,
      required this.phone,
      this.profileImage = ''});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      displayname: json['displayName'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      profileImage:
          json['profile-image'] != null ? json['profile-image'] as String : '',
      dateJoined: json['dateJoined'] == null
          ? null
          : DateTime.parse(json['dateJoined'] as String),
    );
  }

  static Future<Doctor?> fromSharedPref() async {
    var instance = await SharedPreferences.getInstance();
    String? data = instance.getString('profile-data');
    if (data == null) return null;
    var doc = Doctor.fromJson(jsonDecode(data));
    doc.profileImage = instance.getString('profile-image')!;
    return doc;
  }

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayname,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'dateJoined': dateJoined.toString()
    };
  }

  static Future<String?> getImagePath() async {
    var instance = await SharedPreferences.getInstance();
    return instance.getString('profile-image');
  }

  static void setImagePath(String path) async {
    var instance = await SharedPreferences.getInstance();
    instance.setString('profile-image', path);
  }

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

  Future<void> saveToSharedPrefs() async {
    var data = toJson();

    var instance = await SharedPreferences.getInstance();
    instance.setString('profile-data', jsonEncode(data));
  }

  static Future<bool> isSignedUp() async {
    var instance = await SharedPreferences.getInstance();
    return instance.getKeys().contains('profile-data');
  }
}
