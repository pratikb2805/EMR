import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 100.0,
                      color: Colors.black,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: SignInFOrm(),
            )
          ],
        ),
      ),
    );
  }
}

class SignInFOrm extends StatefulWidget {
  @override
  SignInFOrmState createState() {
    return SignInFOrmState();
  }
}

class SignInFOrmState extends State<SignInFOrm> {
  final _username = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _username.addListener(printLatest);
    password.addListener(printLatest);
  }

  void printLatest() {
    print('UserName : ${_username.text}\nPassword :  ${password.text}');
  }

  @override
  Widget build(BuildContext con) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 500),
              width: MediaQuery.of(context).size.width * .50,
              child: TextFormField(
                controller: _username,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a user-name',
                    labelText: 'User Name'),
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
              child: TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter password',
                    labelText: 'Password'),
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
                child: ElevatedButton(
                  // tooltip: '',
                  onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(content: Text(_username.text));
                        })
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
    );
  }
}
