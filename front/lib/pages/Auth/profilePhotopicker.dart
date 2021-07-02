import 'dart:io';

import 'package:emr/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as Path;
import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class ProfilePhotoPicker extends StatefulWidget {
  ProfilePhotoPicker({Key? key, this.filePath}) : super(key: key);
  String? filePath;
  @override
  _ProfilePhotoPickerState createState() => _ProfilePhotoPickerState();
}

class _ProfilePhotoPickerState extends State<ProfilePhotoPicker> {
  bool imageLoaded = false;
  Directory rootPath = Directory('');
  String? filePath;
  String dirPath = '';

  @override
  void initState() {
    super.initState();
    filePath = widget.filePath;
    if (filePath != null && File(filePath!).existsSync()) imageLoaded = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text(
                        'Pick a profile image',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      Container(
                        width: 250,
                        height: 250,
                        child: ClipOval(
                          child: Stack(
                            children: [
                              Center(
                                child: CircleAvatar(
                                    radius: 125,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: imageLoaded
                                        ? FileImage(File(filePath!))
                                        : null,
                                    child: imageLoaded
                                        ? null
                                        : Icon(Icons.photo,
                                            size: 100, color: Colors.black)),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(125),
                        ),
                      ),
                      Spacer(flex: 2),
                      CupertinoButton.filled(
                          onPressed: () {
                            final file = OpenFilePicker()
                              ..filterSpecification = {
                                'PNG Images': '*.png',
                                'JPEG Images (*.jpeg)': '*.jpeg',
                                'JPG Images (*.jpg)': '*.jpg',
                                'All Images': '*.jpg;*.png;*jpeg'
                              }
                              ..defaultFilterIndex = 0
                              ..defaultExtension = 'doc'
                              ..title = 'Select an image';

                            final result = file.getFile();
                            if (result != null) {
                              print(result.path);
                              setState(() {
                                imageLoaded = true;
                                filePath = result.path;
                              });
                            } else {
                              print('error');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Choose',
                            ),
                          )),
                      Spacer(flex: 7),
                      Row(
                        children: [
                          ClipOval(
                            child: Material(
                              color: Colors.blue,
                              child: InkWell(
                                splashColor: Colors.redAccent,
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: Icon(
                                      Icons.keyboard_arrow_left_outlined,
                                      size: 28,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipOval(
                            child: Material(
                              color: Colors.blue,
                              child: InkWell(
                                splashColor: Colors.redAccent,
                                onTap: () async {
                                  if (imageLoaded) {
                                    var path = Path.join(
                                        (await getApplicationSupportDirectory())
                                            .path,
                                        Path.basename(filePath!));
                                    print(path);

                                    File(filePath!).copySync(path);
                                    var instance =
                                        await SharedPreferences.getInstance();
                                    await instance.setString(
                                        'profile-image', path);
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          Future.delayed(Duration(seconds: 2),
                                              () {
                                            Navigator.of(context).pop(true);
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage()));
                                          });

                                          return AlertDialog(
                                            title: Center(
                                                child: Text('Success',
                                                    style: TextStyle(
                                                        fontSize: 16))),
                                            content: Text(
                                              'Image saved successfully.',
                                              style: TextStyle(fontSize: 16),
                                              textAlign: TextAlign.center,
                                            ),
                                          );
                                        });
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Center(
                                                child:
                                                    Text('No image selected')),
                                            content: Text(
                                                'Please select an image to continue.'),
                                          );
                                        });
                                  }
                                },
                                child: SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: Icon(
                                      Icons.keyboard_arrow_right_outlined,
                                      size: 28,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ))),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 20, offset: Offset.zero)
                ]),
          ),
        ),
      ),
    );
  }
}
