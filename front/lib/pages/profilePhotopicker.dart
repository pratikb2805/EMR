import 'dart:io';

import 'package:flutter/material.dart';

class ProfilePhotoPicker extends StatefulWidget {
  ProfilePhotoPicker({Key? key}) : super(key: key);

  @override
  _ProfilePhotoPickerState createState() => _ProfilePhotoPickerState();
}

class _ProfilePhotoPickerState extends State<ProfilePhotoPicker> {
  bool imageLoaded = false;
  String path = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: Container(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      child: Stack(
                        // fit: StackFit.expand,
                        // clipBehavior: Clip.antiAlias,
                        // overflow: Overflow.clip,
                        children: [
                          Center(
                              child: imageLoaded
                                  ? Image.file(File(path))
                                  : Icon(Icons.photo,
                                      size: 100, color: Colors.white)),
                          Positioned(
                            bottom: 0,
                            child: Container(
                                alignment: Alignment.bottomCenter,
                                width: 500,
                                height: 50,
                                color: Colors.green),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    ),
                    Spacer(flex: 7),
                    ClipOval(
                      child: Material(
                        color: Colors.blue, // Button color
                        child: InkWell(
                          splashColor: Colors.redAccent, // Splash color
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
    );
  }
}
