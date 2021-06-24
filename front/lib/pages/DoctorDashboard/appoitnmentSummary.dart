import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:emr/db/patient.dart';
import 'dart:math';
import 'dart:convert';

class AppointmentSummary extends StatefulWidget {
  AppointmentSummary({Key? key, this.controller}) : super(key: key);
  final controller;

  @override
  _AppointmentSummaryState createState() => _AppointmentSummaryState();
}

class _AppointmentSummaryState extends State<AppointmentSummary> {
  bool isloaded = false;
  List<Appointment> meetings = [];
  late AppointmentDataSource source = AppointmentDataSource([]);
  @override
  void initState() {
    super.initState();
    if (!isloaded) {
      getData();
    }
  }

  String formatted(DateTime tm) {
    return DateFormat('hh:mm').format(tm);
  }

  void showAppointmentAlert(Appointment app, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("${app.subject}"),
              content: SingleChildScrollView(
                child: Container(
                    // height: 200,
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
                              """Date : ${app.startTime.day}\nTime : ${formatted(app.startTime)}- ${formatted(app.endTime)}"""),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Desription: ${app.notes}"),
                        )
                      ],
                    )),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.connectionState == ConnectionState.done) {
          if (snap.hasError) return Text('${snap.error}');
          // for (var i in meetings) {
          //   print('${i.startTime}');
          // }

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
                    // constraints: BoxConstraints.expand(),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 500,
                    child: SafeArea(
                      child: SfCalendar(
                        showCurrentTimeIndicator: true,
                        showNavigationArrow: true,
                        showDatePickerButton: true,
                        timeSlotViewSettings: TimeSlotViewSettings(
                            timeInterval: Duration(hours: 2),
                            timeIntervalHeight: 80,
                            timeIntervalWidth: 1000),
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
                        view: CalendarView.day,
                        appointmentTextStyle: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                        dataSource: AppointmentDataSource(meetings),
                        monthViewSettings: MonthViewSettings(
                            // showAgenda: true,
                            appointmentDisplayMode:
                                MonthAppointmentDisplayMode.appointment),
                      ),
                    )),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }

  Future<void> getData() async {
    if (!isloaded) {
      meetings = await fetchData();
      setState(() {
        isloaded = true;
        source = AppointmentDataSource(meetings);
      });
    }
  }

  Color randomCOlor() {
    var colors = Colors.accents;
    var _random = new Random();
    return colors[_random.nextInt(colors.length)];
  }

  Appointment fromJson(Map<String, dynamic> json) {
    return Appointment(
        isAllDay: false,
        startTime: DateTime.parse(json['start']).toLocal(),
        endTime: DateTime.parse(json['end']).toLocal(),
        subject: json['name'] ?? '',
        notes: json['description'] ?? '',
        color: randomCOlor());
  }

  Future<List<Appointment>> fetchData() async {
    final String response =
        await rootBundle.loadString('assets/data/appointment.json');
    final parsed = json.decode(response).cast<Map<String, dynamic>>();
    return parsed.map<Appointment>((json) => fromJson(json)).toList();
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
