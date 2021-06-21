import 'dart:io';

import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart' as p;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class Temp extends StatefulWidget {
  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  List files = [];
  void _listFile() async {
    String directory = 'D:\\Projects\\example';
    setState(() {
      files = Directory(directory).listSync();
      print(directory);
    });
  }

  void initstate() {
    super.initState();
    _listFile();
  }

  @override
  Widget build(BuildContext context) {
    _listFile();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: files.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(files[index].toString());
                })),
      ),
    );
  }
}
