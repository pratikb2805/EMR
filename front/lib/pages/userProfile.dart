import 'package:flutter/material.dart';

class UserprofileWidget extends StatefulWidget {
  final String profile;
  UserprofileWidget({Key? key, this.profile = ''}) : super(key: key);
  @override
  _UserprofileWidgetState createState() => _UserprofileWidgetState();
}

class _UserprofileWidgetState extends State<UserprofileWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator UserprofileWidget - FRAME
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.4,
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.3,
            backgroundImage: NetworkImage(widget.profile),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          )),
    );
  }
}
