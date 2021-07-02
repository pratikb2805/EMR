import 'package:emr/db/store.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'package:emr/db/models.dart' as db;

class NewAppointment extends StatefulWidget {
  final AppointmentModel am;
  final PatientModel pm;
  NewAppointment({Key? key, required this.am, required this.pm});
  @override
  _NewAppointmentState createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  final GlobalKey<FormState> _newAppointmentFormKey = GlobalKey<FormState>();
  final TextEditingController _oldPatientId = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _appointmentDate = TextEditingController();
  final TextEditingController _appointmentStartTime = TextEditingController();
  final TextEditingController _appointmentEndTime = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final CalendarController _calendarController = CalendarController();

  late DateTime start;
  late DateTime end;

  var date = DateTime.now();
  @override
  void initState() {
    super.initState();

    _calendarController.displayDate = this.date;
  }

  String? validator(String text) {
    final nameRegExp = new RegExp(r"^[A-Z][a-z]{1,15}$");
    if (nameRegExp.hasMatch(text)) return null;
    return 'Please provide a valid name';
  }

  String? emailValidate(String value) {
    if (value.isEmpty) return 'E-mail cant be empty';
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) return null;
    return 'Please enter valid email address';
  }

  void getPatientWithPatientId() {
    if (_oldPatientId.text != '') {
      db.Patient? patient = widget.pm.getPatient(_oldPatientId.text);
      if (patient != null) {
        _name.text = patient.name;
        _emailController.text = patient.email;
        _phoneController.text = patient.phone;
      } else {
        _name.text = '';
        _emailController.text = '';
        _phoneController.text = '';
      }
    }
  }

  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _oldPatientId.dispose();
    _name.dispose();
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
            child: Center(
              child: Container(
                  width: 900,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText:
                                        "Patient ID ( ONLY FOR OLD PATIENTS )",
                                    labelText: "Patient ID ",
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    getPatientWithPatientId();
                                  },
                                  controller: _oldPatientId,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.length == 0) {
                                      return "Provide a name";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Full Name",
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {},
                                  controller: _name,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: TextFormField(
                                  validator: (value) =>
                                      this.emailValidate(value!),
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.email),
                                  ),
                                  onChanged: (value) {},
                                  controller: _emailController,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: TextFormField(
                                  validator: (value) {
                                    var regExp = new RegExp(
                                        r'(^(?:[+0]9)?[0-9]{10,12}$)');
                                    if (value!.length == 0) {
                                      return 'Mobile number cant be empty';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Please enter valid mobile number';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Phone No.",
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.phone_iphone),
                                  ),
                                  onChanged: (value) {},
                                  controller: _phoneController,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter valid Date";
                                      } else {
                                        null;
                                      }
                                    },
                                    readOnly: true,
                                    controller: _appointmentDate,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.calendar_today),
                                        labelText: "Next Appointment Date",
                                        border: OutlineInputBorder()),
                                    onTap: () async {
                                      var date = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2100));
                                      if (date != null) {
                                        _calendarController.selectedDate = date;
                                        _appointmentDate.text =
                                            DateFormat('dd-MM-yyyy')
                                                .format(date)
                                                .toString();
                                        setState(() {
                                          start = date;
                                        });
                                      }
                                    },
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter valid Time";
                                      } else {
                                        null;
                                      }
                                    },
                                    readOnly: true,
                                    controller: _appointmentStartTime,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.more_time),
                                        labelText: "Start Time",
                                        border: OutlineInputBorder()),
                                    onTap: () async {
                                      var time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return MediaQuery(
                                            data: MediaQuery.of(context)
                                                .copyWith(
                                                    alwaysUse24HourFormat:
                                                        false),
                                            child: child!,
                                          );
                                        },
                                      );
                                      _appointmentStartTime.text = time != null
                                          ? time.format(context)
                                          : '';
                                    },
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter valid Time";
                                      } else {
                                        null;
                                      }
                                    },
                                    readOnly: true,
                                    controller: _appointmentEndTime,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.more_time),
                                        labelText: "End Time",
                                        border: OutlineInputBorder()),
                                    onTap: () async {
                                      var time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return MediaQuery(
                                            data: MediaQuery.of(context)
                                                .copyWith(
                                                    alwaysUse24HourFormat:
                                                        false),
                                            child: child!,
                                          );
                                        },
                                      );
                                      _appointmentEndTime.text = time != null
                                          ? time.format(context)
                                          : '';
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            )),
        title: Center(
          child: Text("New Appointment",
              style: Fluent.FluentTheme.of(context).typography.subheader),
        ),
        actions: <Widget>[
          Center(
            child: Fluent.Button(
              onPressed: () {
                if (_newAppointmentFormKey.currentState!.validate()) {
                  db.Appointment appointment = db.Appointment(
                      start: start,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      end: start,
                      name: _name.text);
                  if (_oldPatientId.text != '') {
                    db.Patient? patient =
                        widget.pm.getPatient(_oldPatientId.text);
                    print("got patient");
                    if (patient != null) {
                      print("added patient");
                      appointment.patient.target = patient;
                    }
                  }
                  widget.am.addAppointment(appointment);
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: 100,
                height: 40,
                child: Text(
                  "Add Appointment",
                  style: Fluent.FluentTheme.of(context).typography.body,
                ),
              ),
            ),
          ),
        ]);
  }
}
