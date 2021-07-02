import 'package:flutter/material.dart';
// import 'package:form_validator/form_validator.dart';
import 'signUpForm.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  void initState() {
    super.initState();

    // firstName.addListener(() => _updateDisplayName());
    // lastName.addListener(() => _updateDisplayName());
  }

  @override
  void dispose() {
    super.dispose();
  }

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
              child: DetailsForm()),
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
