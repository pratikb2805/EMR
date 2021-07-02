//import 'package:emr/db/patient.dart';
import 'package:emr/db/models.dart';
import 'package:emr/db/store.dart';
import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'userProfile.dart';
// import 'pages.dart';
import 'package:intl/intl.dart';

//
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
    return Fluent.ScaffoldPage(
      padding: EdgeInsets.zero,
      header: Fluent.PageHeader(
        leading: Material(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:
                  Icon(FluentIcons.arrow_left_48_regular, color: Colors.black)),
        ),
        title: Material(
            child: ListTile(
          leading: Icon(
            FluentIcons.person_24_regular,
            color: Colors.black,
          ),
          title: Text(
            'Patient',
          ),
        )),
      ),
      content: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            // alignment: Alignment.topLeft,
            // height: MediaQuery.of(context).size.height,
            child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints con) {
            // if (con.maxWidth < 600) {
            //   return LayoutBuilder(
            //     builder: (BuildContext context, BoxConstraints con) {
            //       if (con.maxWidth < 600) {
            //         return SingleChildScrollView(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               Expanded(child: LeftPart(name: "Prathamesh  Wagh")),
            //               Expanded(child: RightPart())
            //             ],
            //           ),
            //         );
            //       }
            //       return Row(children: [
            //         Expanded(
            //             flex: 3,
            //             child: LeftPart(
            //               name: "Prathamesh Wagh",
            //             )),
            //         Expanded(flex: 7, child: RightPart())
            //       ]);
            //     },
            //   );
            // }
            return SingleChildScrollView(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Fluent.Container(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: PatientPersonalInfo(
                        patient: widget.patient,
                      ),
                    ),
                    // VerticalDivider(
                    //   color: Colors.grey,
                    // ),
                    Expanded(child: DiagnosisDetails(patient: widget.patient))
                  ]),
            );
          },
        )),
      ),
    );
  }
}

class PatientPersonalInfo extends StatelessWidget {
  final Patient patient;
  const PatientPersonalInfo({
    Key? key,
    required this.patient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url =
        'https://th.bing.com/th/id/R34ac62561e4d2d3f73903371539bfb5b?rik=0oRU4BctwhzLIA&riu=http%3a%2f%2fthispix.com%2fwp-content%2fuploads%2f2015%2f06%2fportrait-profile-008.jpg&ehk=ZPTQOU194fjZ2VzGXGXzymsATv6%2fCUW4EFn3Ya53CZ4%3d&risl=&pid=ImgRaw';
    return Fluent.Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: UserprofileWidget(profile: url),
            ),
            Container(child: DataField(header: 'Name', value: patient.name)),
            Container(child: DataField(header: 'Age', value: '${patient.age}')),
            Container(
                child: DataField(
                    header: 'Date of first consult',
                    value: DateFormat('dd/MM/yyyy')
                        .format(patient.dateFirstConsult))),
            Container(
              child: DataField(
                  header: 'Date of most recent consult',
                  value: DateFormat('dd/MM/yyyy')
                      .format(patient.dateMostRecentConsult)),
            ),
            Container(
                child: DataField(header: 'Diagnosis', value: patient.diagnosis))
          ]),
    );
  }
}

class DiagnosisDetails extends StatelessWidget {
  final Patient patient;
  const DiagnosisDetails({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _divider = Divider(
      indent: 34,
      endIndent: 10,
    );
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // alignment: Alignment.topCenter,
          children: [
            DiagnosisDescription(),
            _divider,
            Consumer<PatientModel>(
              builder: (context, model, child) => ReportsWidget(
                model: model,
                patient: patient,
                id: '${patient.id}',
              ),
            ),
            _divider,
            PrescriptionWidget(patient: patient),
            _divider,
            ChallengesWidget()
          ],
        )),
      ),
    );
  }
}

class DiagnosisDescription extends StatelessWidget {
  final String description;
  const DiagnosisDescription(
      {Key? key,
      this.description =
          r'You can set amount to change the amount of stars. The rating must be less than the stars and more than 0. You can also change the icon, its size and color. You can make the bar read only by setting onChanged to null.'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text('Description',
                    style: Fluent.FluentTheme.of(context).typography.subheader),
                SizedBox(height: 16),
                Text(description,
                    style: Fluent.FluentTheme.of(context).typography.subtitle),
              ],
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class ChallengesWidget extends StatelessWidget {
  const ChallengesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 38, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            'Challenges',
            style: Fluent.FluentTheme.of(context).typography.subheader,
          ),
          SizedBox(height: 8),
          Text(
            'Build muscle mass and gain weight.',
            textAlign: TextAlign.left,
            style: Fluent.FluentTheme.of(context).typography.body,
          ),
        ],
      ),
    );
  }
}

class PrescriptionWidget extends StatefulWidget {
  final Patient patient;

  PrescriptionWidget({Key? key, required this.patient});
  @override
  _PrescriptionWidgetState createState() => _PrescriptionWidgetState();
}

class _PrescriptionWidgetState extends State<PrescriptionWidget> {
  List<Prescription> _files = [];

  void _listPref() {
    setState(() {
      _files = widget.patient.prescriptions.toList();
    });
  }

  List<Widget> _getPrescriptionList() {
    return _files
        .map((e) => FileWidget(
              fileLink: e.filePath,
              fileName: DateFormat("dd-MM-yyyy").format(e.date).toString(),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    _listPref();
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Fluent.Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Prescriptions',
                style: Fluent.FluentTheme.of(context).typography.subheader,
              ),
            ),
            widget.patient.prescriptions.isEmpty
                ? Fluent.Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "There are no prescriptions yet",
                      style: Fluent.FluentTheme.of(context).typography.subtitle,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Wrap(
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(),
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: Column(children: <Widget>[
                            ..._getPrescriptionList(),
                          ]),
                        ),
                        SizedBox(width: 16)
                      ],
                    ),
                  ),
          ],
        ));
  }
}

class ReportsWidget extends StatefulWidget {
  final String id;
  final Patient patient;
  final PatientModel model;

  ReportsWidget(
      {Key? key, required this.id, required this.patient, required this.model});
  @override
  _ReportsWidgetState createState() => _ReportsWidgetState();
}

class _ReportsWidgetState extends State<ReportsWidget> {
  String filePath = '';

  void initstate() {
    super.initState();
    _listFile();
  }

  List<PatientFile> _files = [];

  void _listFile() async {
    // String directory = p.join(
    // p.join(
    //   (await getApplicationSupportDirectory()).path,
    //   "patientfiles",
    // ),
    // '${widget.patient.id}');
    setState(() {
      _files = widget.patient.files;
      // _files = Directory(directory).listSync();
    });
  }

  List<Widget> _getReportList() {
    return _files
        .map((e) => FileWidget(
              fileLink: e.path,
              fileName: e.name,
            ))
        .toList();
  }

  void showInformationDialog(BuildContext context, String filePath) async {
    await Fluent.showDialog(
        context: context,
        builder: (context) {
          final _fileNameController = TextEditingController();
          return StatefulBuilder(builder: (context, setState) {
            return Fluent.ContentDialog(
              content: Fluent.Center(
                child: Container(
                    child: Fluent.TextBox(
                  controller: _fileNameController,
                )),
              ),
              title: Text("Enter File Name",
                  style: Fluent.FluentTheme.of(context).typography.header),
              actions: [
                Fluent.Center(
                  child: Fluent.Button(
                      onPressed: () {
                        print(_fileNameController.text);
                        var name = _fileNameController.text;
                        widget.patient.addFile(filePath, name);
                        widget.model.addPatient(widget.patient);
                        Navigator.of(context).pop();
                      },
                      child: Text("Submit")),
                ),
                Fluent.Center(
                  child: Fluent.Button(
                      onPressed: () {
                        print(_fileNameController.text);
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel")),
                )
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    _listFile();
    var textButton = Fluent.Button(
      child: SizedBox(
        width: 200,
        height: 50,
        child: Fluent.Center(
          child: Material(
            borderRadius: BorderRadius.circular(5),
            child: ListTile(
              mouseCursor: MouseCursor.uncontrolled,
              hoverColor: Fluent.FluentTheme.of(context).accentColor,
              leading: Icon(FluentIcons.add_24_regular),
              title: Text(
                'Add Report',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),

      // label: Text("Add Report"),
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
            'All Files': '*.pdf;*.docx;*csv;*.xlsx;*.jpg;*.png;*jpeg'
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
          showInformationDialog(context, filePath);
        } else {
          print('error');
        }
      },
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Reports',
              textAlign: TextAlign.left,
              style: Fluent.FluentTheme.of(context).typography.subheader,
            ),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Wrap(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Column(children: <Widget>[
                    ..._getReportList(),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(5),
                      child: textButton,
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
      // width: MediaQuery.of(context).size.width * 0.8,
      // decoration: BoxDecoration(),
      padding: EdgeInsets.all(2),
      child: Container(
          child: Material(
        child: ListTile(
          dense: true,
          leading: Icon(
            FluentIcons.document_24_regular,
            // size: 20.0,
          ),
          title: Text('$fileName',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: Fluent.FluentTheme.of(context).typography.body),
          trailing: IconButton(
              onPressed: () {
                openFile();
              },
              icon: Icon(FluentIcons.open_24_regular)),
        ),
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
      padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.header,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: Fluent.FluentTheme.of(context).typography.body),
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
