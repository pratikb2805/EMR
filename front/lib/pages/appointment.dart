import 'dart:async';
import 'dart:math';
import 'package:emr/db/patient.dart';
import 'package:emr/pages/pages.dart';
import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:emr/db/store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AppointmentList extends StatefulWidget {
  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
<<<<<<< HEAD
  //final _listController = StreamController<List<Appointment>>(sync: true);
=======
  // final _listController = StreamController<List<Appointment>>(sync: true);
  // late final AppointmentModel vm;
>>>>>>> 9aaac310a34ce8c9cd96eb1fa30a9c5d458d91bb
  bool hasBeenInitialized = false;
  AppointmentModel vm = AppointmentModel();
  @override
  void initState() {
    super.initState();
<<<<<<< HEAD

    setState(() {
      // _listController.addStream(
      //     widget.appointmentModel.queryAppointmentStream.map((q) => q.find()));
=======
    // vm = AppointmentModel();

    setState(() {
      // _listController.addStream(vm.queryAppointmentStream.map((q) => q.find()));
>>>>>>> 9aaac310a34ce8c9cd96eb1fa30a9c5d458d91bb
      hasBeenInitialized = true;
    });
  }

  @override
  void dispose() {
<<<<<<< HEAD
    //_listController.close();
=======
    // _listController.close();
>>>>>>> 9aaac310a34ce8c9cd96eb1fa30a9c5d458d91bb
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
                "Appointments",
                style: Fluent.FluentTheme.of(context).typography.header,
              ),
            ),
            Container(
                height: max(MediaQuery.of(context).size.height * 0.07, 40),
                color: Fluent.FluentTheme.of(context).accentColor,
                child: TextButton.icon(
                    onPressed: () async {
                      print((await getApplicationSupportDirectory()).path);
                      await Fluent.showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, setState) {
<<<<<<< HEAD
                              return NewAppointment(
                                  //appointmentModel: widget.appointmentModel,
                                  //patientModel: widget.patientModel,
                                  );
=======
                              return Consumer<AppointmentModel>(
                                builder: (context, vm, child) =>
                                    Consumer<PatientModel>(
                                  builder: (context, pm, child) =>
                                      NewAppointment(
                                    pm: pm,
                                    am: vm,
                                  ),
                                ),
                              );
>>>>>>> 9aaac310a34ce8c9cd96eb1fa30a9c5d458d91bb
                            });
                          });
                    },
                    icon: Fluent.Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(FluentIcons.add_24_regular,
                          color: Colors.white),
                    ),
                    label: Fluent.Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Add Appointment",
                          style: TextStyle(color: Colors.white)),
                    )))
          ]),
          Consumer<AppointmentModel>(
            // stream: _listController.stream,
            builder: (context, model, child) {
              // if (!snapshot.hasData) {
              //   return Center(
              //     child: CircularProgressIndicator(),
              //   );
              // } else {
              return DataTable(
                appointments: model.getAll(),
              );
            },
          ),
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
  final List<Appointment> appointments;
  DataTable({Key? key, required this.appointments}) : super(key: key);

  @override
  _DataTableState createState() => _DataTableState();
}

class _DataTableState extends State<DataTable> {
  late AppointmentDataSource _source;
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

  void getData() {
    setState(() {
      appointments = widget.appointments;
      _source = AppointmentDataSource(
        appointments: appointments,
      );
    });
  }

  void initstate() {
    print(widget.appointments);
    setState(() {
      appointments = widget.appointments;
      _source = AppointmentDataSource(appointments: appointments);
    });
    super.initState();
  }

  // Future<List<Appointment>> fetchData() async {
  //   final String response =
  //       await rootBundle.loadString('assets/data/appointment.json');
  //   final parsed = json.decode(response).cast<Map<String, dynamic>>();
  //   return parsed.map<Appointment>((json) => fromJson(json)).toList();
  // }

  // Appointment fromJson(Map<String, dynamic> json) {
  //   return Appointment(
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
  //     appointments = await fetchData();
  //     setState(() {
  //       isLoaded = true;
  //       _source = AppointmentDataSource(appointments);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    getData();
    var lableStyle = Fluent.FluentTheme.of(context)
        .typography
        .body!
        .apply(fontSizeDelta: 2, fontWeightDelta: 2);
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
                style: lableStyle,
              ),
              onSort: (int columnIndex, bool ascending) =>
                  _sort<num>((Appointment d) => d.id, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Name',
                style: lableStyle,
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Appointment d) => d.name, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Date',
                style: lableStyle,
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Appointment d) => d.start.toString(),
                  columnIndex,
                  ascending)),
          DataColumn(
              label: Text(
                'Start Time',
                style: lableStyle,
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Appointment d) => d.start.toString(),
                  columnIndex,
                  ascending)),
          DataColumn(
              label: Text(
                'End Time',
                style: lableStyle,
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Appointment d) => d.end.toString(), columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Phone',
                style: lableStyle,
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Appointment d) => d.phone, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Email',
                style: Fluent.FluentTheme.of(context)
                    .typography
                    .body!
                    .apply(fontSizeDelta: 2, fontWeightDelta: 2),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (Appointment d) => d.email, columnIndex, ascending)),
          DataColumn(
            label: Container(),
          ),
        ],
      ),
    );
  }
}

class AppointmentDataSource extends DataTableSource {
  final List<Appointment> appointments;
  AppointmentDataSource({required this.appointments});

  void _sort<T>(Comparable<T> getField(Appointment d), bool ascending) {
    appointments.sort((Appointment a, Appointment b) {
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
    final Appointment appointment = appointments[index];
    return DataRow(cells: [
      DataCell(Text(appointment.id.toString())),
      DataCell(Text(appointment.name)),
      DataCell(Text(DateFormat('dd/MM/yyyy').format(appointment.start))),
      DataCell(Text(DateFormat('hh:mm').format(appointment.start))),
      DataCell(Text(DateFormat('hh:mm').format(appointment.end))),
      DataCell(Text(appointment.phone)),
      DataCell(Text(appointment.email)),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ActionRow(
            index: appointment.id,
            patient: appointment,
          ),
          Container(
              width: 25,
              height: 25,
              child: Fluent.IconButton(
                // backgroundColor: Colors.white,
                icon: Padding(
                    padding: EdgeInsets.all(1),
                    child: Icon(
                      FluentIcons.delete_24_regular,
                      color: Colors.black,
                      size: 20,
                    )),
                onPressed: () {
                  //appointmentModel.removeAppointment(appointment);
                },
              ))
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => appointments.length;

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
            return PatientEditForm(appointment: widget.patient);
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 25,
        height: 25,
        child: Fluent.IconButton(
          // backgroundColor: Colors.white,
          icon: Center(
              child: Icon(
            FluentIcons.checkmark_24_regular,
            color: Colors.black,
            size: 20,
          )),
          onPressed: () {
            showInformationDialog(context);
          },
        ));
  }
}
