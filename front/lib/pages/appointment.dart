import 'dart:math';
import 'package:emr/objectbox.g.dart';
import 'package:emr/pages/pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class AppointmentList extends StatefulWidget {
  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: max(MediaQuery.of(context).size.height * 0.1, 70),
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Appointments",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Container(
            child: DataTable(),
          )
        ],
      ),
    );
  }
}

Future<List<Patient>> fetchData() async {
  final String response = await rootBundle.loadString('assets/data/data.json');
  final parsed = json.decode(response).cast<Map<String, dynamic>>();
  return parsed.map<Patient>((json) => Patient.fromJson(json)).toList();
}

// List<Patient> parseData(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<Patient>((json) => Patient.fromJson(json)).toList();
// }

class DataTable extends StatefulWidget {
  @override
  _DataTableState createState() => _DataTableState();
}

class _DataTableState extends State<DataTable> {
  DTS _source = DTS([]);
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  bool isLoaded = false;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  void _sort<T>(
      Comparable<T> getField(Patient d), int columnIndex, bool ascending) {
    _source._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  Future<void> getData() async {
    final patients = await fetchData();
    //print(patients);
    if (!isLoaded) {
      setState(() {
        _source = DTS(patients);
        isLoaded = true;
      });
    }
  }

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
                'Company',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Patient d) => d.companyName, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'First name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Patient d) => d.firstName, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Last name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Patient d) => d.lastName, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Phone',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Patient d) => d.phone, columnIndex, ascending)),
          DataColumn(
              label: Text(
            'Completed/Delete',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}

class DTS extends DataTableSource {
  final List<Patient> _patients;
  DTS(this._patients);

  void _sort<T>(Comparable<T> getField(Patient d), bool ascending) {
    _patients.sort((Patient a, Patient b) {
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
    final Patient patient = _patients[index];
    return DataRow(cells: [
      DataCell(Text(patient.id.toString())),
      DataCell(Text(patient.companyName)),
      DataCell(Text(patient.firstName)),
      DataCell(Text(patient.lastName)),
      DataCell(Text(patient.phone)),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ActionRow(
            index: index,
            patient: patient,
          ),
          Container(
              width: 25,
              height: 25,
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Icon(
                      Icons.delete,
                      size: 20,
                    )),
                onPressed: () {
                  print('Remove');
                },
              ))
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _patients.length;

  @override
  int get selectedRowCount => 0;
}

class ActionRow extends StatefulWidget {
  ActionRow({Key? key, required this.index, required this.patient})
      : super(key: key);

  final index;
  final Patient patient;
  @override
  _ActionRowState createState() => _ActionRowState();
}

class _ActionRowState extends State<ActionRow> {
  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return PatientEditForm(widget.patient);
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 25,
        height: 25,
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.check),
          onPressed: () async {
            await showInformationDialog(context);
          },
        ));
  }
}
