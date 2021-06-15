import 'package:flutter/material.dart';

class DoctorTopBar extends StatelessWidget {
  const DoctorTopBar({
    Key? key,
    required this.urll,
  }) : super(key: key);

  final String urll;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // decoration: BoxDecoration(color: Colors.white10),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            child: Stack(
              children: <Widget>[
                HeaderbgWidget(),
                Positioned(
                    top: 170,
                    left: 50,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(urll),
                      ),
                    )),
                Positioned(
                  top: 200,
                  left: 160,
                  child: NamepositionWidget(
                    name: 'Piyush Patil',
                    qualification:
                        'MD Mbbs(Baburao college of medical Science,UP)',
                  ),
                ),
                Positioned(
                  top: 210,
                  right: 25,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shadowColor: null,
                        side: BorderSide(width: 0, color: Colors.white)),
                    child: Icon(Icons.edit, color: Colors.grey),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              AlertDialog(title: Text('Button pressed')));
                    },
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
  NamepositionWidget(
      {Key? key, required this.name, required this.qualification})
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
            style: TextStyle(
                color: Color.fromRGBO(15, 38, 68, 1),
                fontFamily: 'Open Sans',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
          SizedBox(height: 0),
          Text(
            widget.qualification,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(114, 128, 148, 1),
                fontFamily: 'Open Sans',
                fontSize: 16,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.3846153846153846),
          ),
        ],
      ),
    );
  }
}
