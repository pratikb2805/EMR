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

class AppointmentList extends StatefulWidget {
  final AppointmentModel appointmentModel;
  final PatientModel patientModel;
  AppointmentList(
      {Key? key, required this.appointmentModel, required this.patientModel});
  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  final _listController = StreamController<List<Appointment>>(sync: true);
  bool hasBeenInitialized = false;
  AppointmentModel vm = AppointmentModel();
  @override
  void initState() {
    super.initState();

    setState(() {
      _listController.addStream(
          widget.appointmentModel.queryAppointmentStream.map((q) => q.find()));
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
                              return NewAppointment(
                                appointmentModel: widget.appointmentModel,
                                patientModel: widget.patientModel,
                              );
                            });
                          });
                    },
                    icon: Fluent.Padding(
                      padding: const EdgeInsets.all(4.0),
                      child:
                          Icon(FluentIcons.add_24_regular, color: Colors.white),
                    ),
                    label: Fluent.Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Add Appointment",
                          style: TextStyle(color: Colors.white)),
                    )))
          ]),
          !hasBeenInitialized
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : StreamBuilder<List<Appointment>>(
                  stream: _listController.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return DataTable(
                        appointments: snapshot.data!,
                        appointmentModel: widget.appointmentModel,
                        patientModel: widget.patientModel,
                      );
                    }
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
  final AppointmentModel appointmentModel;
  final patientModel;
  DataTable(
      {Key? key,
      required this.appointments,
      required this.appointmentModel,
      required this.patientModel})
      : super(key: key);

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
          appointmentModel: widget.appointmentModel,
          patientModel: widget.patientModel);
    });
  }

  void initstate() {
    print(widget.appointments);
    setState(() {
      appointments = widget.appointments;
      _source = AppointmentDataSource(
          appointments: appointments,
          appointmentModel: widget.appointmentModel,
          patientModel: widget.patientModel);
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
            label: Container(),
          ),
        ],
      ),
    );
  }
}

class AppointmentDataSource extends DataTableSource {
  final List<Appointment> appointments;
  final AppointmentModel appointmentModel;
  final patientModel;
  AppointmentDataSource(
      {required this.appointments,
      required this.appointmentModel,
      required this.patientModel});

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
      DataCell(Text(appointment.start.toString())),
      DataCell(Text(appointment.end.toString())),
      DataCell(Text(appointment.phone)),
      DataCell(Text(appointment.email)),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ActionRow(
            patientModel: patientModel,
            appointmentModel: appointmentModel,
            index: appointment.id,
            patient: appointment,
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
                  appointmentModel.removeAppointment(appointment);
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
  ActionRow(
      {Key? key,
      required this.index,
      required this.patient,
      required this.appointmentModel,
      required this.patientModel})
      : super(key: key);

  final index;
  final PatientModel patientModel;
  final AppointmentModel appointmentModel;
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
            return PatientEditForm(
                patientModel: widget.patientModel,
                appointment: widget.patient,
                appointmentModel: widget.appointmentModel);
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
