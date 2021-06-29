import 'dart:async';
import 'dart:math';
import 'package:emr/db/patient.dart';
import 'package:emr/pages/pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:emr/db/store.dart';
import 'package:path_provider/path_provider.dart';

class PatientList extends StatefulWidget {
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  final _listController = StreamController<List<Patient>>(sync: true);
  late final PatientModel vm;
  bool hasBeenInitialized = false;

  @override
  void initState() {
    super.initState();

    getApplicationDocumentsDirectory().then((dir) {
      vm = PatientModel(dir);
    });

    setState(() {
      _listController.addStream(vm.queryPatientStream.map((q) => q.find()));
      hasBeenInitialized = true;
    });
  }

  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              height: max(MediaQuery.of(context).size.height * 0.1, 70),
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Patients",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ]),
          !hasBeenInitialized
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : StreamBuilder<List<Patient>>(
                  stream: _listController.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return PatientDataTable(
                        patients: snapshot.data!,
                        vm: vm,
                      );
                    }
                  },
                ),
        ],
      ),
    );
  }
}

// List<Patient> parseData(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<Patient>((json) => Patient.fromJson(json)).toList();
// }

class PatientDataTable extends StatefulWidget {
  final List<Patient> patients;
  final PatientModel vm;
  PatientDataTable({Key? key, required this.patients, required this.vm})
      : super(key: key);

  @override
  _PatientDataTableState createState() => _PatientDataTableState();
}

class _PatientDataTableState extends State<PatientDataTable> {
  late PatientDataSource _source;
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  bool isLoaded = false;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  List<Patient> patients = [];

  void _sort<T>(
      Comparable<T> getField(Patient d), int columnIndex, bool ascending) {
    _source._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  void getData() {
    setState(() {
      patients = widget.patients;
      _source = PatientDataSource(patients, widget.vm);
    });
  }

  void initstate() {
    print(widget.patients);
    setState(() {
      patients = widget.patients;
      _source = PatientDataSource(patients, widget.vm);
    });
    super.initState();
  }

  // Future<List<Patient>> fetchData() async {
  //   final String response =
  //       await rootBundle.loadString('assets/data/patient.json');
  //   final parsed = json.decode(response).cast<Map<String, dynamic>>();
  //   return parsed.map<Patient>((json) => fromJson(json)).toList();
  // }

  // Patient fromJson(Map<String, dynamic> json) {
  //   return Patient(
  //     start: DateTime.parse(json['start']).toLocal(),
  //     end: DateTime.parse(json['end']).toLocal(),
  //     name: json['name'] ?? '',
  //     description: json['description'] ?? '',
  //     email: json['email'] ?? '',
  //     phone: json['phone'] ?? '',
  //   );
  // }

  // Future<void> getData() async {
  //   if (!isLoaded) {
  //     patients = await fetchData();
  //     setState(() {
  //       isLoaded = true;
  //       _source = PatientDataSource(patients);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    getData();
    return SingleChildScrollView(
      child: PaginatedDataTable(
        source: _source,
        rowsPerPage: _rowsPerPage,
        sortAscending: _sortAscending,
        sortColumnIndex: _sortColumnIndex,
        availableRowsPerPage: [10, 20, 30, 50],
        showFirstLastButtons: true,
        onRowsPerPageChanged: (newRowsPerPage) {
          setState(() {
            _rowsPerPage = newRowsPerPage!;
          });
        },
        columns: [
          DataColumn(
              label: Text(
                'ID',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) =>
                  _sort<num>((Patient d) => d.id, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) =>
                  _sort<String>((Patient d) => d.name, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Diagnosis',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Patient d) => d.diagnosis.toString(),
                  columnIndex,
                  ascending)),
          DataColumn(
              label: Text(
                'Phone',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Patient d) => d.phone, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Patient d) => d.email, columnIndex, ascending)),
        ],
      ),
    );
  }
}

class PatientDataSource extends DataTableSource {
  final List<Patient> _patient;
  final PatientModel vm;
  PatientDataSource(this._patient, this.vm);

  void _sort<T>(Comparable<T> getField(Patient d), bool ascending) {
    _patient.sort((Patient a, Patient b) {
      if (!ascending) {
        final Patient c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    final Patient patient = _patient[index];
    return DataRow(cells: [
      DataCell(Text(patient.id.toString())),
      DataCell(OpenProfileInfoButton(patient: patient)),
      DataCell(Text(patient.diagnosis.toString())),
      DataCell(Text(patient.phone)),
      DataCell(Text(patient.email)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _patient.length;

  @override
  int get selectedRowCount => 0;
}

class OpenProfileInfoButton extends StatelessWidget {
  final Patient patient;
  OpenProfileInfoButton({required this.patient});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(patient.name),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                PatientprofileWidget(patient: patient))));
  }
}
