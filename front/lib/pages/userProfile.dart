import 'package:flutter/material.dart';

class UserprofileWidget extends StatefulWidget {
  final String name;
  final String profile;
  UserprofileWidget({Key? key, this.name = '', this.profile = ''})
      : super(key: key);
  @override
  _UserprofileWidgetState createState() => _UserprofileWidgetState();
}

class _UserprofileWidgetState extends State<UserprofileWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator UserprofileWidget - FRAME
    return Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(widget.profile)))),
              ),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    '${widget.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(62, 62, 62, 1),
                        fontFamily: 'Work Sans',
                        fontSize: 16,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )),
            ]));
  }
}
