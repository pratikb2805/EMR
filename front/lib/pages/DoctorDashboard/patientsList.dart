import 'package:emr/db/db.dart';
import 'package:emr/pages/pages.dart';
import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientsList extends StatefulWidget {
  final onPressed;
  PatientsList({this.onPressed = null});
  @override
  _PatientsListState createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PatientModel>(
      builder: (context, model, child) => Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 100, 5),
                        child: MediaQuery.of(context).size.width > 100
                            ? Text(
                                'Patients',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Open Sans',
                                    fontSize: 24,
                                    decoration: TextDecoration.none,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )
                            : Icon(Fluent.Icons.people)),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent, // Button color
                          child: InkWell(
                            splashColor: Colors.blueAccent, // Splash color
                            onTap: widget.onPressed,
                            child: SizedBox(
                                width: 32,
                                height: 32,
                                child: Icon(Icons.keyboard_arrow_right)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ...model.getTop().map((e) => PatientTile(
                    patient: e,
                  ))
            ],
          )),
    );
  }
}

class PatientTile extends StatefulWidget {
  final Patient patient;
  PatientTile({Key? key, required this.patient}) : super(key: key);
  @override
  _PatientTileState createState() => _PatientTileState();
}

class _PatientTileState extends State<PatientTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Fluent.ListTile(
          title: MediaQuery.of(context).size.width > 100
              ? Text(
                  widget.patient.name,
                  overflow: TextOverflow.ellipsis,
                )
              : null,
          subtitle: MediaQuery.of(context).size.width > 100
              ? Text(
                  widget.patient.diagnosis,
                  overflow: TextOverflow.ellipsis,
                )
              : null,
          trailing: Fluent.IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PatientprofileWidget(patient: widget.patient)));
            },
            icon: Icon(FluentIcons.info_24_regular, color: Colors.black),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              FluentIcons.person_support_24_regular,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
