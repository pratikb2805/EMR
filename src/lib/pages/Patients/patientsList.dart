import 'dart:async';
import 'package:emr/db/models.dart' as db;

import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:emr/db/store.dart';

class PatientsList extends StatefulWidget {
  @override
  _PatientsListState createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
  final _listController = StreamController<List<db.Patient>>(sync: true);
  late final PatientModel _vm;
  bool hasBeenInitialized = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() {
      hasBeenInitialized = true;
    });
  }

  @override
  void dispose() {
    _listController.close();
    _vm.dispose();
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
              height: 70,
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Patients",
                style: Fluent.FluentTheme.of(context).typography.header,
              ),
            ),
          ]),
          StreamBuilder<List<db.Patient>>(
            stream: _listController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text('Eror');
              if (snapshot.hasData)
                return PatientsDataTable(
                  patients: snapshot.data ?? [],
                );
              else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
        ],
      ),
    );
  }
}

class PatientsDataTable extends StatefulWidget {
  final List<db.Patient> patients;

  PatientsDataTable({Key? key, required this.patients}) : super(key: key);

  @override
  _PatientsDataTableState createState() => _PatientsDataTableState();
}

class _PatientsDataTableState extends State<PatientsDataTable> {
  PatientDataSource _source = PatientDataSource([]);
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  bool isLoaded = false;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  List<db.Patient> Patients = [];

  void _sort<T>(
      Comparable<T> getField(db.Patient d), int columnIndex, bool ascending) {
    _source._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  void initstate() {
    setState(() {
      Patients = widget.patients;
      _source = PatientDataSource(Patients);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  _sort<num>((db.Patient d) => d.id, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (db.Patient d) => d.name, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'First Consult',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (db.Patient d) => d.dateFirstConsult.toString(),
                  columnIndex,
                  ascending)),
          DataColumn(
              label: Text(
                'Last Consult',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (db.Patient d) => d.dateMostRecentConsult.toString(),
                  columnIndex,
                  ascending)),
          DataColumn(
              label: Text(
                'Phone',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (db.Patient d) => d.phone, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (db.Patient d) => d.email, columnIndex, ascending)),
          DataColumn(
            label: Container(),
          ),
        ],
      ),
    );
  }
}

class PatientDataSource extends DataTableSource {
  final List<db.Patient> Patients;
  PatientDataSource(this.Patients);

  void _sort<T>(Comparable<T> getField(db.Patient d), bool ascending) {
    Patients.sort((db.Patient a, db.Patient b) {
      if (!ascending) {
        final db.Patient c = a;
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
    final patient = Patients[index];
    return DataRow(cells: [
      DataCell(Text(patient.id.toString())),
      DataCell(Text(patient.name)),
      DataCell(Text(patient.dateFirstConsult.toString())),
      DataCell(Text(patient.dateMostRecentConsult.toString())),
      DataCell(Text(patient.phone)),
      DataCell(Text(patient.email)),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PatientActionRow(
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
  int get rowCount => Patients.length;

  @override
  int get selectedRowCount => 0;
}

class PatientActionRow extends StatefulWidget {
  PatientActionRow({Key? key, required this.index, required this.patient})
      : super(key: key);

  final index;
  final db.Patient patient;
  @override
  _PatientActionRowState createState() => _PatientActionRowState();
}

class _PatientActionRowState extends State<PatientActionRow> {
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
