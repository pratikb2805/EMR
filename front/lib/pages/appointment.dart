import 'dart:math';
import 'package:emr/db/patient.dart';
import 'package:emr/objectbox.g.dart';
import 'package:emr/pages/pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:emr/db/models.dart';

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
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                height: max(MediaQuery.of(context).size.height * 0.07, 40),
                color: Colors.green,
                child: TextButton.icon(
                    onPressed: () async {
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, setState) {
                              return NewAppointment();
                            });
                          });
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                    label: Text("Add Appointment",
                        style: TextStyle(color: Colors.white))))
          ]),
          Container(
            child: DataTable(),
          )
        ],
      ),
    );
  }
}

// List<Appointment> parseData(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<Appointment>((json) => Appointment.fromJson(json)).toList();
// }

class DataTable extends StatefulWidget {
  @override
  _DataTableState createState() => _DataTableState();
}

class _DataTableState extends State<DataTable> {
  AppointmentDataSource _source = AppointmentDataSource([]);
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  bool isLoaded = false;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  List<Appointment> appointments = [];

  void _sort<T>(
      Comparable<T> getField(Appointment d), int columnIndex, bool ascending) {
    _source._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  Future<List<Appointment>> fetchData() async {
    final String response =
        await rootBundle.loadString('assets/data/appointment.json');
    final parsed = json.decode(response).cast<Map<String, dynamic>>();
    return parsed.map<Appointment>((json) => fromJson(json)).toList();
  }

  Appointment fromJson(Map<String, dynamic> json) {
    return Appointment(
      start: DateTime.parse(json['start']).toLocal(),
      end: DateTime.parse(json['end']).toLocal(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Future<void> getData() async {
    if (!isLoaded) {
      appointments = await fetchData();
      setState(() {
        isLoaded = true;
        _source = AppointmentDataSource(appointments);
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
                  _sort<num>((Appointment d) => d.id, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Appointment d) => d.name, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Start Time',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Appointment d) => d.start.toString(),
                  columnIndex,
                  ascending)),
          DataColumn(
              label: Text(
                'End Time',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Appointment d) => d.end.toString(), columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Phone',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Appointment d) => d.phone, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Appointment d) => d.email, columnIndex, ascending)),
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

class AppointmentDataSource extends DataTableSource {
  final List<Appointment> _patients;
  AppointmentDataSource(this._patients);

  void _sort<T>(Comparable<T> getField(Appointment d), bool ascending) {
    _patients.sort((Appointment a, Appointment b) {
      if (!ascending) {
        final Appointment c = a;
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
    final Appointment patient = _patients[index];
    return DataRow(cells: [
      DataCell(Text(patient.id.toString())),
      DataCell(Text(patient.name)),
      DataCell(Text(patient.start.toString())),
      DataCell(Text(patient.end.toString())),
      DataCell(Text(patient.phone)),
      DataCell(Text(patient.email)),
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
  final Appointment patient;
  @override
  _ActionRowState createState() => _ActionRowState();
}

class _ActionRowState extends State<ActionRow> {
  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(child: Text("Hi I'm Siri"));
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
