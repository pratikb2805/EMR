import 'package:emr/pages/form1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emr/utils/util.dart' as utils;
import 'package:fluent_ui/fluent_ui.dart' as fluent;

import 'dart:io';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String name = ' ';
  bool isloaded = false;
  String imagepath = '';
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var doc = await utils.Doctor.fromSharedPref();
    var path = await utils.Doctor.getImagePath();
    if (doc != null) {
      setState(() {
        name = doc.displayname;
        imagepath = path;
        isloaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext con) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Login Page")),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: isloaded
                        ? CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(File(imagepath)),
                          )
                        : Icon(
                            Icons.account_circle_outlined,
                            size: 100.0,
                            color: Colors.black,
                          )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Center(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        width: MediaQuery.of(context).size.width * .50,
                        child: Text(name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize: 32,
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Center(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: PasswordField(
                          text: 'Password',
                          controller: password,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Center(
                      child: Container(
                          constraints: BoxConstraints(maxWidth: 500),
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: CupertinoButton.filled(
                            // tooltip: '',
                            onPressed: () async {
                              var status = await utils.Doctor.verifyPassword(
                                  password.text);
                              if (!status) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text('Error'),
                                      );
                                    });
                              } else
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text('Success'),
                                      );
                                    });
                            },
                            child: Container(
                                height: 50.0,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Sign In'),
                                  ],
                                )),
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
