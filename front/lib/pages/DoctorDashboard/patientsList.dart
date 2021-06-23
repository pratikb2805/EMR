import 'package:flutter/material.dart';

class PatientsList extends StatefulWidget {
  @override
  _PatientsListState createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: Text(
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
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipOval(
                      child: Material(
                        color: Colors.transparent, // Button color
                        child: InkWell(
                          splashColor: Colors.blueAccent, // Splash color
                          onTap: () {},
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
            PatientTile(),
            PatientTile(),
            PatientTile()
          ],
        ));
  }
}

class PatientTile extends StatefulWidget {
  final String name, diagnosis;
  PatientTile(
      {Key? key, this.name = 'Patient Name', this.diagnosis = 'Diagnosis'})
      : super(key: key);
  @override
  _PatientTileState createState() => _PatientTileState();
}

class _PatientTileState extends State<PatientTile> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator PatientTile - FRAME - VERTICAL

    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70'),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(),
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(width: 12),
                              Container(
                                decoration: BoxDecoration(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      widget.name,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(15, 38, 68, 1),
                                          fontFamily: 'Open Sans',
                                          fontSize: 14,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.4285714285714286),
                                    ),
                                    SizedBox(height: 0),
                                    Text(
                                      widget.diagnosis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(114, 128, 148, 1),
                                          fontFamily: 'Open Sans',
                                          fontSize: 13,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.3846153846153846),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    iconSize: 18.0,
                    padding: EdgeInsets.all(5.0),
                    icon: Icon(Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey),
                    onPressed: () {},
                    // style: ElevatedButton.styleFrom(
                    //     shape: CircleBorder(), primary: Colors.white),
                    // child: ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
