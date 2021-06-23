import 'dart:io';

import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart' as p;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class Temp2 extends StatefulWidget {
  @override
  _Temp2State createState() => _Temp2State();
}

class _Temp2State extends State<Temp2> {
  String filePath = '';
  Future<void> copyFile(File result) async {
    File newFile = await result.copy('D:\\Projects\\copy\\report1.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
          child: Container(
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
                'All Files': '*.pdf;*.docx;*csv;*.xlsx'
              }
              ..defaultFilterIndex = 0
              ..defaultExtension = 'doc'
              ..title = 'Select an File';

            final result = file.getFile();
            if (result != null) {
              print(result.path);
              copyFile(result);
              setState(() {
                filePath = result.path;
              });
            } else {
              print('error');
            }
          },
        ),
      )),
    ));
  }
}
