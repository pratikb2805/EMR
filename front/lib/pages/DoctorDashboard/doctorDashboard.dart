import 'package:flutter/material.dart';
import 'doctorTop.dart';
import 'patientsList.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'appoitnmentSummary.dart';
import 'package:emr/utils/util.dart';

class DoctorDashboards extends StatefulWidget {
  DoctorDashboards({Key? key}) : super(key: key);

  @override
  _DoctorDashboardsState createState() => _DoctorDashboardsState();
}

class _DoctorDashboardsState extends State<DoctorDashboards> {
  CalendarController _calendarController = CalendarController();
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
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: !isloaded
          ? null
          : SingleChildScrollView(
              child: Column(
              children: [
                doc != null
                    ? DoctorTopBar(
                        urll: doc!.profileImage, name: doc!.displayname)
                    : DoctorTopBar(name: "Prathamesh Wagh", urll: urll),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 10,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CardBadgeWidget(
                                                    icon: Icons.ballot,
                                                    name: 'Apointments')),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CardBadgeWidget(
                                                  icon: Icons.people,
                                                  name: 'Patients'),
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CardBadgeWidget(
                                                    icon: Icons.assignment,
                                                    name: 'Reports')),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CardBadgeWidget(
                                                  icon: Icons.notifications,
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
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          )),
                      Expanded(
                        flex: 4,
                        child: Column(
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
                                  child: SfCalendar(
                                    view: CalendarView.month,
                                    // allowViewNavigation: true,
                                    showDatePickerButton: true,
                                    todayHighlightColor: Colors.blueAccent,
                                    onTap: (CalendarTapDetails details) {
                                      setState(() {
                                        if (_calendarController.displayDate !=
                                            details.date)
                                          _calendarController.displayDate =
                                              details.date;
                                      });
                                    },
                                  ),
                                ))
                          ],
                        ),
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
  final int count;
  CardBadgeWidget(
      {Key? key, this.name = 'NAME', @required this.icon, this.count = 0})
      : super(key: key);
  @override
  _CardBadgeWidgetState createState() => _CardBadgeWidgetState();
}

class _CardBadgeWidgetState extends State<CardBadgeWidget> {
  final bgColor = Colors.white, bgColorH = Colors.blue;
  final iconColor = Colors.grey, iconColorH = Colors.white;
  bool ishove = false;
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
                  color: (ishove ? bgColorH : bgColor),
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
