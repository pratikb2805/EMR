import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'userProfile.dart';

class PatientprofileWidget extends StatefulWidget {
  @override
  _PatientprofileWidgetState createState() => _PatientprofileWidgetState();
}

class _PatientprofileWidgetState extends State<PatientprofileWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator PatientprofileWidget - FRAME

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10.0),
          ),
        ),
        textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
        title: Container(
            alignment: Alignment.topLeft,
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                'Patient',
                style: TextStyle(color: Colors.white),
              ),
            )),
      ),
      body: Card(
        child: Container(
          // alignment: Alignment.topLeft,
          // height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints con) {
              if (con.maxWidth < 600) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LeftPart(width: MediaQuery.of(context).size.width * .9),
                      RIghtPart(width: MediaQuery.of(context).size.width * .9)
                    ]);
              }
              return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LeftPart(width: MediaQuery.of(context).size.width * 0.3),
                    RIghtPart(width: MediaQuery.of(context).size.width * 0.7)
                  ]);
            },
          )),
        ),
      ),
    );
  }
}

class LeftPart extends StatelessWidget {
  final double width;
  const LeftPart({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url =
        'https://th.bing.com/th/id/R34ac62561e4d2d3f73903371539bfb5b?rik=0oRU4BctwhzLIA&riu=http%3a%2f%2fthispix.com%2fwp-content%2fuploads%2f2015%2f06%2fportrait-profile-008.jpg&ehk=ZPTQOU194fjZ2VzGXGXzymsATv6%2fCUW4EFn3Ya53CZ4%3d&risl=&pid=ImgRaw';
    return Container(
        width: width,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    child:
                        UserprofileWidget(name: 'Pratik Bedre', profile: url),
                  )),
              DataField(header: 'Name', value: 'Pratik Bedre'),
              DataField(header: 'Age', value: '23'),
              DataField(header: 'Date of first consult', value: '28/05/2001'),
              DataField(
                  header: 'Date of most recent consult', value: '28/05/2001'),
              DataField(header: 'diagnosis', value: '28/05/2001'),
            ]));
  }
}

class RIghtPart extends StatelessWidget {
  final double width;
  const RIghtPart({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          alignment: Alignment.topRight,
          width: width,
          child: Card(
              child: Wrap(
            // alignment: Alignment.topCenter,
            children: [
              DescriptionWidget(),
              ReportsWidget(),
              ChallengesWidger()
            ],
          ))),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(247, 247, 247, 1),
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Description',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(62, 62, 62, 1),
                      fontFamily: 'Work Sans',
                      fontSize: 24,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                SizedBox(height: 16),
                Text(
                  'Fabian\'s lifestyle is quite active. He works out three times a week. His fitness routine is a healthy mix of strength-training and cardio. Apart from fitness, his priority is a healthy and balanced diet. He have some sort of a meal plan, but he is quite fliexible with it.\nHe prefers to do shopping online because it is convenient and less time-consuming, as he can do it whenever it suits him.fbrbbbbbbbbbrif 3fffrrfybwecbob3ufb93fr9ubrebvpurevurev',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(62, 62, 62, 1),
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1.5),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class ChallengesWidger extends StatelessWidget {
  const ChallengesWidger({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Challenge',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(62, 62, 62, 1),
                fontFamily: 'Work Sans',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
          SizedBox(height: 8),
          Text(
            'Build muscle mass and gain weight.',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(62, 62, 62, 1),
                fontFamily: 'Roboto',
                fontSize: 24,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1.5),
          ),
        ],
      ),
    );
  }
}

class ReportsWidget extends StatelessWidget {
  const ReportsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Reports',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(62, 62, 62, 1),
                fontFamily: 'Work Sans',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    FileWidget(fileName: 'REport1.pdf'),
                    SizedBox(height: 16),
                    FileWidget(fileName: 'REport1.pdf'),
                    SizedBox(height: 16),
                    FileWidget(fileName: 'REport1.pdf'),
                    SizedBox(height: 16),
                    FileWidget(fileName: 'REport1.pdf'),
                  ]),
                ),
                SizedBox(width: 16)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FileWidget extends StatelessWidget {
  final String fileName, fileLink;
  const FileWidget({Key? key, this.fileLink = '', this.fileName = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(
          child: ListTile(
              leading: Icon(
                Icons.circle,
              ),
              title: Text(
                '$fileName',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(62, 62, 62, 1),
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1.5),
              ))),
    );
  }
}

class DataField extends StatefulWidget {
  final String header, value;
  DataField({Key? key, this.header = ' ', this.value = ''}) : super(key: key);
  @override
  DataFieldState createState() => DataFieldState();
}

class DataFieldState extends State<DataField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            widget.header,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(140, 140, 161, 1),
                fontFamily: 'Work Sans',
                fontSize: 18,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
          SizedBox(height: 15),
          Text(
            widget.value,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(62, 62, 62, 1),
                fontFamily: 'Work Sans',
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1.2),
          ),
        ],
      ),
    );
  }
}
