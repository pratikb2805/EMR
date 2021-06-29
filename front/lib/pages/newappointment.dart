import 'package:emr/pages/DoctorDashboard/appoitnmentSummary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class NewAppointment extends StatefulWidget {
  @override
  _NewAppointmentState createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  final GlobalKey<FormState> _newAppointmentFormKey = GlobalKey<FormState>();
  final TextEditingController _appointmentDate = TextEditingController();
  final TextEditingController _appointmentStartTime = TextEditingController();
  final TextEditingController _appointmentEndTime = TextEditingController();
  final CalendarController _calendarController = CalendarController();

  void dispose() {
    _appointmentDate.dispose();
    _appointmentEndTime.dispose();
    _appointmentStartTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        content: Form(
          key: _newAppointmentFormKey,
          child: Container(
              width: 900,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextFormField(
                            readOnly: true,
                            controller: _appointmentDate,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.calendar_today),
                                constraints: BoxConstraints(maxHeight: 45),
                                labelText: "Next Appointment Date",
                                border: OutlineInputBorder()),
                            onTap: () async {
                              var date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100));
                              _appointmentDate.text = date != null
                                  ? DateFormat('dd-MM-yyyy')
                                      .format(date)
                                      .toString()
                                  : '';
                              _calendarController.selectedDate = date!;
                            },
                          )),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: TextFormField(
                            readOnly: true,
                            controller: _appointmentStartTime,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.more_time),
                                constraints: BoxConstraints(maxHeight: 45),
                                labelText: "Start Time",
                                border: OutlineInputBorder()),
                            onTap: () async {
                              var time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (BuildContext context, Widget? child) {
                                  return MediaQuery(
                                    data: MediaQuery.of(context)
                                        .copyWith(alwaysUse24HourFormat: false),
                                    child: child!,
                                  );
                                },
                              );
                              _appointmentStartTime.text =
                                  time != null ? time.format(context) : '';
                            },
                          )),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: TextFormField(
                            readOnly: true,
                            controller: _appointmentEndTime,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.more_time),
                                constraints: BoxConstraints(maxHeight: 45),
                                labelText: "End Time",
                                border: OutlineInputBorder()),
                            onTap: () async {
                              var time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (BuildContext context, Widget? child) {
                                  return MediaQuery(
                                    data: MediaQuery.of(context)
                                        .copyWith(alwaysUse24HourFormat: false),
                                    child: child!,
                                  );
                                },
                              );
                              _appointmentEndTime.text =
                                  time != null ? time.format(context) : '';
                            },
                          )),
                    ],
                  ),
                  AppointmentSummary(
                    controller: _calendarController,
                  )
                ],
              )),
        ),
        title: Center(
          child: Text("New Appointment"),
        ),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_newAppointmentFormKey.currentState!.validate()) {
                  // Do something like updating SharedPreferences or User Settings etc.
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: 100,
                height: 40,
                child: Text("Add Appointment"),
              ),
            ),
          ),
        ]);
  }
}
