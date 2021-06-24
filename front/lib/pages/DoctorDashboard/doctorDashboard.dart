import 'package:flutter/material.dart';
import 'doctorTop.dart';
import 'patientsList.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'appoitnmentSummary.dart';
import 'package:emr/utils/util.dart';
import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'package:system_theme/system_theme.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class DoctorDashboards extends StatefulWidget {
  DoctorDashboards({Key? key}) : super(key: key);

  @override
  _DoctorDashboardsState createState() => _DoctorDashboardsState();
}

class _DoctorDashboardsState extends State<DoctorDashboards> {
  CalendarController _calendarController = CalendarController();
  var date = DateTime.now();
  @override
  void initState() {
    super.initState();
    _calendarController.displayDate = DateTime.now();
    Doctor.fromSharedPref().then((doctor) {
      setState(() {
        doc = doctor;
        isloaded = true;
      });
    });
  }

  bool isloaded = false;
  late Doctor? doc;

  final urll =
      'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70';
  @override
  Widget build(BuildContext context) {
    return Fluent.Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: !isloaded
          ? null
          : SingleChildScrollView(
              child: Column(
              children: [
                DoctorTopBar(urll: doc!.profileImage, name: doc!.displayname),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.grey,
                                      width: 1.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CardBadgeWidget(
                                              color: SystemTheme
                                                  .accentInstance.accent
                                                  .toAccentColor(),
                                              icon: FluentIcons
                                                  .briefcase_medical_24_regular,
                                              name: 'Apointments')),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CardBadgeWidget(
                                            color: SystemTheme
                                                .accentInstance.accent
                                                .toAccentColor(),
                                            icon: FluentIcons.people_24_regular,
                                            name: 'Patients'),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CardBadgeWidget(
                                              color: SystemTheme
                                                  .accentInstance.accent
                                                  .toAccentColor(),
                                              icon: FluentIcons
                                                  .book_information_24_regular,
                                              name: 'Reports')),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CardBadgeWidget(
                                            color: SystemTheme
                                                .accentInstance.accent
                                                .toAccentColor(),
                                            icon: FluentIcons.alert_24_regular,
                                            name: 'Notifications'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              AppointmentSummary(
                                controller: _calendarController,
                              )
                            ],
                          ),
                        ),
                      )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 300,
                              ),
                              child: SafeArea(child: PatientsList())),
                          ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Fluent.DatePicker(
                                  // cursor: MouseCursor,
                                  selected: date,
                                  onChanged: (v) {
                                    setState(() {
                                      date = v;
                                      this._calendarController.displayDate = v;
                                    });
                                  },
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
    );
  }
}

class CardBadgeWidget extends StatefulWidget {
  final icon;
  final String name;
  final color;
  final int count;
  CardBadgeWidget(
      {Key? key,
      required this.color,
      this.name = 'NAME',
      @required this.icon,
      this.count = 0})
      : super(key: key);
  @override
  _CardBadgeWidgetState createState() => _CardBadgeWidgetState();
}

class _CardBadgeWidgetState extends State<CardBadgeWidget> {
  var bgColor = Colors.white, bgColorH;
  final iconColor = Colors.black, iconColorH = Colors.white;
  bool ishove = false;
  @override
  void initState() {
    super.initState();
    bgColorH = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator CardBadgeWidget - FRAME

    return MouseRegion(
        onEnter: (PointerEvent details) {
          setState(() {
            ishove = true;
          });
        },
        onExit: (PointerEvent details) {
          setState(() {
            ishove = false;
          });
        },
        child: Card(
          child: Container(
              decoration: BoxDecoration(
                  color: (ishove ? widget.color : bgColor),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.grey.shade100)),
              height: 120,
              width: 180,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          widget.icon,
                          color: ishove ? iconColorH : iconColor,
                          size: 48,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text('${widget.count}',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                                color: ishove ? iconColorH : iconColor))),
                    Padding(
                        padding: EdgeInsets.all(2),
                        child: Text('${widget.name}',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: ishove ? iconColorH : iconColor)))
                  ])),
        ));
  }
}
