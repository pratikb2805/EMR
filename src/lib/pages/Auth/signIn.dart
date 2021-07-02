import 'package:emr/pages/Auth/signUpForm.dart';
import 'package:emr/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emr/db/AuthUtils.dart' as utils;

import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'dart:io';
import 'package:page_transition/page_transition.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String name = ' ';
  String qualificaions = '';
  bool isloaded = false;
  String? imagepath;
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
        if (doc.qualifications != null)
          qualificaions = doc.qualifications!.join(' ');
        else
          qualificaions = '';
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
                    child: imagepath != null
                        ? CircleAvatar(
                            radius: 80,
                            backgroundImage: FileImage(File(imagepath!)),
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
                        width: Fluent.MediaQuery.of(context).size.width * .50,
                        child: Column(
                          children: [
                            Text(name,
                                textAlign: TextAlign.center,
                                style: Fluent.FluentTheme.of(context)
                                    .typography
                                    .title),
                            Text(qualificaions,
                                textAlign: TextAlign.center,
                                style: Fluent.FluentTheme.of(context)
                                    .typography
                                    .subtitle),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Center(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        width: Fluent.MediaQuery.of(context).size.width * 0.50,
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
                          width:
                              Fluent.MediaQuery.of(context).size.width * 0.50,
                          child: CupertinoButton.filled(
                            onPressed: () async {
                              var status = await utils.Doctor.verifyPassword(
                                  password.text);
                              if (!status) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text('Incorrect password'),
                                      );
                                    });
                              } else
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType
                                            .leftToRightWithFade,
                                        child: HomePage()));
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
