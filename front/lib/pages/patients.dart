import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'pages.dart';
import 'package:flutter/services.dart';

class PatientsList extends StatefulWidget {
  @override
  _PatientsListState createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
  List<Patient> _items = [];
  Future<List<Patient>> fetchData() async {
    final String response =
        await rootBundle.loadString('assets/data/data.json');
    final parsed = json.decode(response).cast<Map<String, dynamic>>();

    return parsed.map<Patient>((json) => Patient.fromJson(json)).toList();
  }

  // List<Patient> parseData(String responseBody) {
  //   return parsed.map<Patient>((json) => Patient.fromJson(json)).toList();
  // }
  // Fetch content from the json file

  Widget build(BuildContext context) {
    return Text("All Patients");
  }
}
