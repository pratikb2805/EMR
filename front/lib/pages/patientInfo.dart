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
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Container(
            // alignment: Alignment.topLeft,
            // height: MediaQuery.of(context).size.height,
            child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints con) {
            if (con.maxWidth < 600) {
              return SingleChildScrollView(
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                            child: LeftPart(
                                width: MediaQuery.of(context).size.width))),
                    Expanded(
                        child: RIghtPart(
                            width: MediaQuery.of(context).size.width * .9))
                  ],
                ),
              );
            }
            return Row(children: [
              Expanded(
                  flex: 3,
                  child: LeftPart(width: MediaQuery.of(context).size.width)),
              Expanded(
                  flex: 7,
                  child:
                      RIghtPart(width: MediaQuery.of(context).size.width * 0.7))
            ]);
          },
        )),
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
      child: Expanded(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: UserprofileWidget(name: 'Pratik Bedre', profile: url),
              ),

              Expanded(child: DataField(header: 'Name', value: 'Pratik Bedre')),
              // Expanded(child: DataField(header: 'Age', value: '23')),
              // Expanded(
              //     child: DataField(
              //         header: 'Date of first consult', value: '28/05/2001')),
              // Expanded(
              //   child: DataField(
              //       header: 'Date of most recent consult', value: '28/05/2001'),
              // ),
              // Expanded(
              //     child: DataField(header: 'diagnosis', value: 'Scelorsis')),
            ]),
      ),
    );
  }
}

class RIghtPart extends StatelessWidget {
  final double width;
  const RIghtPart({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            alignment: Alignment.topRight,
            width: width,
            child: Card(
                child: Column(
              // alignment: Alignment.topCenter,
              children: [
                DescriptionWidget(),
                SizedBox(height: 10),
                ReportsWidget(),
                SizedBox(height: 20),
                ChallengesWidger()
              ],
            ))),
      ),
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
                      fontSize: 30,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
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
          SizedBox(height: 20),
          Text(
            'Challenge',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(62, 62, 62, 1),
                fontFamily: 'Work Sans',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.w900,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black, width: 5.0))),
              child: Text(
                'Reports',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(62, 62, 62, 1),
                    fontFamily: 'Work Sans',
                    fontSize: 24,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.bold,
                    height: 1),
              ),
            ),
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
                  child: Column(children: <Widget>[
                    FileWidget(fileName: 'Report1.pdf'),
                    SizedBox(height: 8),
                    FileWidget(fileName: 'Report1.pdf'),
                    SizedBox(height: 8),
                    FileWidget(fileName: 'Report1.pdf'),
                    SizedBox(height: 8),
                    FileWidget(fileName: 'Report1.pdf'),
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
      width: MediaQuery.of(context).size.width * 0.8,
      // decoration: BoxDecoration(),
      padding: EdgeInsets.all(2),
      child: Container(
          child: ListTile(
              leading: Icon(
                Icons.circle,
                size: 10.0,
              ),
              title: Text(
                '$fileName',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
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
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Text(
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
          ),
          SizedBox(height: 15),
          Expanded(
            child: Text(
              widget.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(62, 62, 62, 1),
                  fontFamily: 'Work Sans',
                  fontSize: 20,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1.2),
            ),
          ),
        ],
      ),
    );
  }
}
