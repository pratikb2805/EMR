import 'package:flutter/material.dart';
import 'profilePhotopicker.dart';

class DetailsForm extends StatefulWidget {
  DetailsForm({Key? key}) : super(key: key);
  @override
  _DetailsFormState createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final displayName = TextEditingController();
  final address = TextEditingController();
  final pass = TextEditingController();
  final passR = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String? validator(String text) {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    if (nameRegExp.hasMatch(text)) return null;
    return 'f';
  }

  Route _createRoute() {
    return PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProfilePhotoPicker());
  }

  String? emailValidate(String value) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) return null;
    return ' ';
  }

  @override
  Widget build(BuildContext context) {
    var form = Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Sign Up Form',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    height: 0,
                  )),
            ),
            Divider(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
              child: Text('Personal Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    height: 0,
                  )),
            ),
            Row(
              children: [
                Expanded(
                  // first name
                  flex: 5,
                  child: FormField(
                      validator: (value) => this.validator(value),
                      onchange: (value) {
                        setState(() {
                          displayName.text =
                              "Dr. ${firstName.text} ${lastName.text}";
                        });
                      },
                      controller: firstName,
                      labe: "First Name",
                      hint: "Your first Name here"),
                ),
                Expanded(
                  flex: 5,
                  // last name
                  child: FormField(
                    validator: (value) => this.validator(value),
                    onchange: (value) {
                      setState(() {
                        displayName.text =
                            "Dr. ${firstName.text} ${lastName.text}";
                      });
                    },
                    controller: lastName,
                    labe: "Last Name",
                    hint: "Your last name",
                  ),
                ),
              ],
            ),
            FormField(
              validator: (value) => this.validator(value),
              onchange: (value) => {},
              controller: displayName,
              labe: "Display Name",
              hint: "Display name",
            ),
            FormField(
                validator: (text) {
                  return null;
                },
                icon: Icons.house_outlined,
                onchange: (value) {},
                controller: address,
                hint: "Address here",
                labe: "Address"),
            Row(
              children: [
                Expanded(
                  // first name
                  flex: 5,
                  child: FormField(
                      icon: Icons.email_outlined,
                      validator: (value) => this.emailValidate(value),
                      onchange: (value) {},
                      controller: null,
                      labe: "Email ID",
                      hint: "Email Address"),
                ),
                Expanded(
                  flex: 5,
                  // last name
                  child: FormField(
                    icon: Icons.phone_iphone,
                    validator: (value) => null,
                    onchange: (value) {},
                    controller: phoneController,
                    labe: "Phone No.",
                    hint: "Phone Number",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  // first name
                  flex: 5,
                  child: PasswordField(
                    text: 'Passwords',
                    controller: pass,
                  ),
                ),
                Expanded(
                  flex: 5,
                  // last name
                  child: PasswordField(
                    text: 'Re-enter your password',
                    controller: passR,
                  ),
                ),
              ],
            ),
            Divider(),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Material(
                  color: Colors.blue, // Button color
                  child: InkWell(
                    splashColor: Colors.redAccent, // Splash color
                    onTap: () {
                      Navigator.of(context).push(_createRoute());
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
              ),
            ))
          ],
        ),
      ),
    );
    return Center(
        child: SingleChildScrollView(
      child: form,
    ));
  }
}

class PasswordField extends StatefulWidget {
  PasswordField({Key? key, @required this.controller, @required this.text})
      : super(key: key);
  final controller;

  final text;
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool visible = false;
  dynamic icon = Icons.visibility_rounded;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Material(
          child: TextFormField(
            enableSuggestions: false,
            autocorrect: false,
            obscureText: !visible,
            controller: widget.controller,
            decoration: InputDecoration(
              // icon: Icon(Icons.password),
              suffixIcon: IconButton(
                icon: Icon(
                  icon,
                  color: Colors.black,
                ),
                onPressed: () {
                  if (!visible) {
                    setState(() {
                      visible = true;
                      icon = Icons.visibility_off_rounded;
                    });
                  } else {
                    setState(() {
                      visible = false;
                      icon = Icons.visibility_rounded;
                    });
                  }
                },
              ),
              // errorText: 'Invalid input',
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: new BorderSide(color: Colors.black)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: new BorderSide(color: Colors.grey)),
              labelText: widget.text,
              labelStyle: TextStyle(color: Colors.black),
              hintText: widget.text,
            ),
          ),
        ));
  }
}

class FormField extends StatefulWidget {
  final controller;
  final onchange;
  final hint, labe, validator;

  final icon;
  FormField(
      {Key? key,
      this.icon = null,
      @required this.validator,
      @required this.onchange,
      @required this.controller,
      @required this.hint,
      @required this.labe})
      : super(key: key);

  @override
  _FormFieldState createState() => _FormFieldState();
}

class _FormFieldState extends State<FormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        child: TextFormField(
          validator: widget.validator,
          onChanged: (value) => widget.onchange(value),
          controller: widget.controller,
          decoration: InputDecoration(
              icon: widget.icon != null
                  ? IconButton(
                      onPressed: () {},
                      icon: Icon(
                        widget.icon,
                        color: Colors.black,
                      ))
                  : null,
              // errorText: 'Invalid input',
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: new BorderSide(color: Colors.black)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: new BorderSide(color: Colors.grey)),
              labelText: widget.labe,
              labelStyle: TextStyle(color: Colors.black),
              hintText: widget.hint),
        ),
      ),
    );
  }
}
