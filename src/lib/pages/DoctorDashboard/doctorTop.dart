import 'dart:io';
import 'package:emr/pages/pages.dart';
import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorTopBar extends StatelessWidget {
  const DoctorTopBar({
    Key? key,
    required this.name,
    required this.urll,
  }) : super(key: key);
  final String name;
  final String urll;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 311,
      child: Padding(
          padding: EdgeInsets.zero,
          child: Container(
            child: Stack(
              children: <Widget>[
                HeaderbgWidget(),
                Positioned(
                    top: 150,
                    left: 30,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(File(urll)),
                      ),
                    )),
                Positioned(
                  top: 200,
                  left: 180,
                  child: NamepositionWidget(
                    style: Theme.of(context).textTheme,
                    name: '$name',
                    qualification: 'MD Mbbs',
                  ),
                ),
                Positioned(
                  top: 210,
                  right: 25,
                  child: Fluent.Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Fluent.IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    actionsPadding: EdgeInsets.all(8),
                                    actions: [
                                      TextButton.icon(
                                          onPressed: () {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              CupertinoPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        SignIn(),
                                              ),
                                              (route) => false,
                                            );
                                          },
                                          icon: Fluent.Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Icon(
                                                FluentIcons
                                                    .checkmark_24_regular,
                                                color: Colors.black),
                                          ),
                                          label: Fluent.Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Yes',
                                              style:
                                                  Fluent.FluentTheme.of(context)
                                                      .typography
                                                      .subtitle,
                                            ),
                                          )),
                                      TextButton.icon(
                                          autofocus: true,
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: Fluent.Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Icon(
                                                FluentIcons.dismiss_24_regular,
                                                color: Colors.black),
                                          ),
                                          label: Fluent.Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'No',
                                              style:
                                                  Fluent.FluentTheme.of(context)
                                                      .typography
                                                      .subtitle,
                                            ),
                                          ))
                                    ],
                                    title: Text(
                                      'Are you sure?',
                                      style: Fluent.FluentTheme.of(context)
                                          .typography
                                          .subtitle,
                                    ),
                                  ));
                        },
                        icon: Fluent.Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            FluentIcons.sign_out_24_regular,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 210,
                  right: 75,
                  child: Fluent.Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Fluent.IconButton(
                        onPressed: () {},
                        icon: Fluent.Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            FluentIcons.edit_24_regular,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class HeaderbgWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          image: DecorationImage(
              image: AssetImage('images/Headerbg.png'), fit: BoxFit.fitWidth),
        ));
  }
}

class NamepositionWidget extends StatefulWidget {
  final String name, qualification;
  final style;
  NamepositionWidget(
      {Key? key,
      required this.name,
      required this.qualification,
      required this.style})
      : super(key: key);

  @override
  _NamepositionWidgetState createState() => _NamepositionWidgetState();
}

class _NamepositionWidgetState extends State<NamepositionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.name,
            textAlign: TextAlign.left,
            style: widget.style.title,
          ),
          SizedBox(height: 0),
          Text(
            widget.qualification,
            textAlign: TextAlign.left,
            style: widget.style.subtitle,
          ),
        ],
      ),
    );
  }
}
