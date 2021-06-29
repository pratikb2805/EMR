//import 'package:emr/db/patient.dart';
import 'dart:io';
import 'package:emr/db/patient.dart';
import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'userProfile.dart';

//import 'package:objectbox/objectbox.dart';
class PatientprofileWidget extends StatefulWidget {
  final Patient patient;
  PatientprofileWidget({Key? key, required this.patient});
  @override
  _PatientprofileWidgetState createState() => _PatientprofileWidgetState();
}

class _PatientprofileWidgetState extends State<PatientprofileWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator PatientprofileWidget - FRAME

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
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
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            // alignment: Alignment.topLeft,
            // height: MediaQuery.of(context).size.height,
            child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints con) {
            if (con.maxWidth < 600) {
              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints con) {
                  if (con.maxWidth < 600) {
                    final width = MediaQuery.of(context).size.width;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: LeftPart(
                                name: "Prathamesh  Wagh", width: width)),
                        Expanded(child: RightPart(width: width))
                      ],
                    );
                  }
                  return Row(children: [
                    Expanded(
                        flex: 3,
                        child: LeftPart(
                            name: "Prathamesh Wagh",
                            width: MediaQuery.of(context).size.width)),
                    Expanded(
                        flex: 7,
                        child: RightPart(
                            width: MediaQuery.of(context).size.width * 0.7))
                  ]);
                },
              );
            }
            return Row(children: [
              Expanded(
                  flex: 3,
                  child: LeftPart(
                      name: "Prathamesh Wagh",
                      width: MediaQuery.of(context).size.width * 0.3)),
              Expanded(
                  flex: 7,
                  child:
                      RightPart(width: MediaQuery.of(context).size.width * 0.7))
            ]);
          },
        )),
      ),
    );
  }
}

class LeftPart extends StatelessWidget {
  final String name;
  final double width;

  const LeftPart({Key? key, required this.width, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url =
        'https://th.bing.com/th/id/R34ac62561e4d2d3f73903371539bfb5b?rik=0oRU4BctwhzLIA&riu=http%3a%2f%2fthispix.com%2fwp-content%2fuploads%2f2015%2f06%2fportrait-profile-008.jpg&ehk=ZPTQOU194fjZ2VzGXGXzymsATv6%2fCUW4EFn3Ya53CZ4%3d&risl=&pid=ImgRaw';
    return ListView(shrinkWrap: true, children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(1.0),
        child: UserprofileWidget(profile: url),
      ),
      Container(child: DataField(header: 'Name', value: name)),
      Container(child: DataField(header: 'Age', value: '23')),
      Container(
          child:
              DataField(header: 'Date of first consult', value: '28/05/2001')),
      Container(
        child: DataField(
            header: 'Date of most recent consult', value: '28/05/2001'),
      ),
      Container(child: DataField(header: 'Diagnosis', value: 'Scelorsis')),
    ]);
  }
}

class RightPart extends StatelessWidget {
  final double width;
  const RightPart({Key? key, required this.width}) : super(key: key);

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
                ReportsWidget(
                  id: "1",
                ),
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

class ReportsWidget extends StatefulWidget {
  final String id;
  ReportsWidget({Key? key, required this.id});
  @override
  _ReportsWidgetState createState() => _ReportsWidgetState();
}

class _ReportsWidgetState extends State<ReportsWidget> {
  String filePath = '';
  void initstate() {
    super.initState();
    _listFile();
  }

  List _files = [];

  void _listFile() async {
    String directory = p.join(
      (await getApplicationSupportDirectory()).path,
      "patientfiles",
    );
    setState(() {
      _files = Directory(directory).listSync();
    });
  }

  List<Widget> _getReportList() {
    List<Widget> reports = [];
    if (_files.isEmpty) {
      reports.add(Text(
        "There are no reports yet",
        style: TextStyle(
            color: Color.fromRGBO(62, 62, 62, 1),
            fontFamily: 'Roboto',
            fontSize: 24,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.5),
      ));
    } else {
      for (int i = 0; i < _files.length; i++) {
        reports.add(FileWidget(
          fileLink: _files[i].path,
          fileName: p.basename(_files[i].path),
        ));
        reports.add(SizedBox(
          height: 8,
        ));
      }
    }
    return reports;
  }

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Container(child: TextField()),
              title: Text("Enter File Name"),
              actions: [TextButton(onPressed: () {}, child: Text("Submit"))],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    _listFile();
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
                    ..._getReportList(),
                    Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(5),
                      child: TextButton.icon(
                        icon: Icon(Icons.add_rounded),
                        label: Text("Add Report"),
                        onPressed: () {
                          final file = OpenFilePicker()
                            ..filterSpecification = {
                              'PDF Files': '*.pdf',
                              'WORD Files (*.docx)': '*.docx',
                              'EXCEL Files (*.xlsx)': '*.xlsx',
                              'CSV Files (*.csv)': '*.csv',
                              'PNG Images': '*.png',
                              'JPEG Images (*.jpeg)': '*.jpeg',
                              'JPG Images (*.jpg)': '*.jpg',
                              'All Files':
                                  '*.pdf;*.docx;*csv;*.xlsx;*.jpg;*.png;*jpeg'
                            }
                            ..defaultFilterIndex = 0
                            ..defaultExtension = 'doc'
                            ..title = 'Select an File';

                          final result = file.getFile();
                          if (result != null) {
                            print(result.path);
                            setState(() {
                              filePath = result.path;
                            });
                            showInformationDialog(context);
                          } else {
                            print('error');
                          }
                        },
                      ),
                    )
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

  Future<void> openFile() async {
    final _result = await OpenFile.open(fileLink);
    print(_result.message);
  }

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
        ),
        trailing: IconButton(
            onPressed: () {
              openFile();
            },
            icon: Icon(Icons.open_in_new)),
      )),
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
      height: 75,
      decoration: BoxDecoration(),
      padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.header,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(62, 62, 62, 1),
              fontFamily: 'Work Sans',
              fontSize: 18,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.value,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(62, 62, 62, 1),
              fontFamily: 'Work Sans',
              fontSize: 20,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
