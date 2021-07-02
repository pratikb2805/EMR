import 'package:flutter/foundation.dart';
import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:math';
import 'package:emr/db/store.dart';
import 'package:emr/db/models.dart' as db;

class AppointmentSummary extends StatefulWidget {
  AppointmentSummary({Key? key, this.controller}) : super(key: key);
  final controller;

  @override
  _AppointmentSummaryState createState() => _AppointmentSummaryState();
}

class _AppointmentSummaryState extends State<AppointmentSummary> {
  bool hasBeenInitialized = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      isloaded = true;
    });
  }

  bool isloaded = false;

  String formatted(DateTime tm) {
    return DateFormat('hh:mm').add_jm().format(tm);
  }

  void showAppointmentAlert(Appointment app, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("${app.subject}"),
              content: SingleChildScrollView(
                child: Container(
                    width: 200,
                    constraints: BoxConstraints(maxHeight: 500),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                              """Date : ${DateFormat('dd/MM/yyyy').format(app.startTime)}\nTime : ${formatted(app.startTime)} - ${formatted(app.endTime)}"""),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Description: ${app.subject}"),
                        )
                      ],
                    )),
              ),
            ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isloaded) return Fluent.ProgressRing();
    return Consumer<AppointmentModel>(
      builder: (context, model, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 5, 10),
                  child: Text(
                    'Appointments',
                    style: TextStyle(
                        fontSize: 36.0,
                        decoration: TextDecoration.none,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 500,
                  child: SafeArea(
                    child: SfCalendar(
                      todayHighlightColor:
                          Fluent.FluentTheme.of(context).accentColor,
                      showCurrentTimeIndicator: true,
                      showNavigationArrow: true,
                      timeSlotViewSettings: TimeSlotViewSettings(
                          timeInterval: Duration(hours: 2),
                          timeIntervalHeight: 80,
                          timeIntervalWidth: 0),
                      onTap: (CalendarTapDetails details) {
                        if (details.targetElement ==
                                CalendarElement.appointment ||
                            details.targetElement ==
                                CalendarElement.viewHeader) {
                          final Appointment appointmentDetails =
                              details.appointments![0];
                          showAppointmentAlert(appointmentDetails, context);
                        } else if (details.targetElement ==
                            CalendarElement.allDayPanel) {
                          print('tapped on date');
                        }
                      },
                      controller: widget.controller,
                      view: CalendarView.schedule,
                      appointmentTextStyle: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                      dataSource: AppointmentDataSource(
                          model.getAll().map((e) => fromDB(e)).toList()),
                      monthViewSettings: MonthViewSettings(
                          appointmentDisplayMode:
                              MonthAppointmentDisplayMode.appointment),
                    ),
                  )),
            ),
          ],
        );
      },
    );
  }

  get randomCOlor {
    var colors = Colors.accents;
    var _random = new Random();
    return colors[_random.nextInt(colors.length)];
  }

  Appointment fromDB(db.Appointment ap) {
    return Appointment(
        startTime: ap.start,
        endTime: ap.end,
        isAllDay: false,
        subject: ap.name,
        notes: ap.description,
        color: randomCOlor);
  }

  Appointment fromJson(Map<String, dynamic> json) {
    return Appointment(
        isAllDay: false,
        startTime: DateTime.parse(json['start']).toLocal(),
        endTime: DateTime.parse(json['end']).toLocal(),
        subject: json['name'] ?? '',
        notes: json['description'] ?? '',
        color: randomCOlor);
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endTime;
  }

  @override
  String getSubject(int index) {
    return appointments![index].subject;
  }

  @override
  Color getColor(int index) {
    return appointments![index].color;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
