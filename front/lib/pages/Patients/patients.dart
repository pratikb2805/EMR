import 'dart:async';
import 'dart:math';
import 'package:emr/db/db.dart';
import 'package:emr/pages/pages.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'package:provider/provider.dart';

class PatientList extends StatefulWidget {
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  final _listController = StreamController<List<Patient>>(sync: true);

  bool hasBeenInitialized = false;

  @override
  void initState() {
    super.initState();

    setState(() {
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
          Consumer<PatientModel>(
            builder: (context, model, child) {
              return PatientDataTable(
                patients: model.getAll(),
                vm: model,
              );
            },
          ),
        ],
      ),
    );
  }
}

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
    setState(() {
      patients = widget.patients;
      _source = PatientDataSource(patients, widget.vm);
    });
    super.initState();
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
              numeric: true,
              label: Text(
                'ID',
                style: Fluent.FluentTheme.of(context)
                    .typography
                    .body!
                    .apply(fontSizeDelta: 2, fontWeightDelta: 2),
              ),
              onSort: (int columnIndex, bool ascending) =>
                  _sort<num>((Patient d) => d.id, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Name',
                style: Fluent.FluentTheme.of(context)
                    .typography
                    .body!
                    .apply(fontSizeDelta: 2, fontWeightDelta: 2),
              ),
              onSort: (int columnIndex, bool ascending) =>
                  _sort<String>((Patient d) => d.name, columnIndex, ascending)),
          DataColumn(
              tooltip: 'Diagnosis',
              label: Text(
                'Diagnosis',
                style: Fluent.FluentTheme.of(context)
                    .typography
                    .body!
                    .apply(fontSizeDelta: 2, fontWeightDelta: 2),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Patient d) => d.diagnosis.toString(),
                  columnIndex,
                  ascending)),
          DataColumn(
              tooltip: 'Patient phone +XX XXX XXX',
              label: Text(
                'Phone',
                style: Fluent.FluentTheme.of(context)
                    .typography
                    .body!
                    .apply(fontSizeDelta: 2, fontWeightDelta: 2),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Patient d) => d.phone, columnIndex, ascending)),
          DataColumn(
              tooltip: 'Patient Email',
              label: Text(
                'Email',
                style: Fluent.FluentTheme.of(context)
                    .typography
                    .body!
                    .apply(fontSizeDelta: 2, fontWeightDelta: 2),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Patient d) => d.email, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Actions',
                style: Fluent.FluentTheme.of(context)
                    .typography
                    .body!
                    .apply(fontSizeDelta: 2, fontWeightDelta: 2),
              ),
              onSort: (int columnIndex, bool ascending) => {}),
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
      DataCell(IconButton(
        onPressed: () {
          vm.removePatient(patient);
        },
        icon: Icon(FluentIcons.delete_24_regular, color: Colors.black),
      ))
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
            builder: (BuildContext context) => PatientprofileWidget(
                key: ValueKey<int>(patient.id), patient: patient))));
  }
}
