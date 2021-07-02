import 'package:fluentui_system_icons/fluentui_system_icons.dart';
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
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width * 0.4,
          child: CircleAvatar(
            radius: 102,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 100,
              child: Icon(
                FluentIcons.person_24_regular,
                color: Colors.black54,
                size: 200,
              ),
            ),
          ),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white)),
    );
  }
}
