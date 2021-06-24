import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart' as Fluent;
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
      // decoration: BoxDecoration(color: Colors.white10),
      width: MediaQuery.of(context).size.width,
      height: 311,
      child: Padding(
          padding: EdgeInsets.all(5.0),
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
                        onPressed: () {},
                        icon: Fluent.Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Fluent.Icons.edit,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // child: Material(
                  //   child: RawMaterialButton(
                  //     // style: ElevatedButton.styleFrom(
                  //     //     primary: Colors.white,
                  //     //     shadowColor: null,
                  //     //     side: BorderSide(width: 0, color: Colors.white)),
                  //     child: Icon(Icons.edit_rounded, size: 20),
                  //     padding: EdgeInsets.all(5.0),
                  //     shape: CircleBorder(),

                  //     onPressed: () {
                  //       showDialog(
                  //           context: context,
                  //           builder: (BuildContext context) =>
                  //               AlertDialog(title: Text('Button pressed')));
                  //     },
                  //   ),
                  // ),
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
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
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
    // Figma Flutter Generator NamepositionWidget - FRAME - VERTICAL

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
