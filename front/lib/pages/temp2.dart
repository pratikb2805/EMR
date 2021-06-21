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
  void _listFile() async {
    final _result =
        await OpenFile.open('C:\\Users\\lenovo\\Downloads\\CSI101_End.pdf');
    print(_result.message);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: ElevatedButton(
          child: Text("Open"),
          onPressed: () {
            _listFile();
          },
        )),
      ),
    );
  }
}
