import 'package:flutter/material.dart';
import 'pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMR',
      home: BodyWidget(),
    );
  }
}

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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Container(
            constraints: BoxConstraints(maxWidth: 500),
            width: MediaQuery.of(context).size.width * 0.50,
            child: TextFormField(
              controller: _username,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a user-name',
                  labelText: 'User Name'),
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
          child: Container(
              constraints: BoxConstraints(maxWidth: 500),
              width: MediaQuery.of(context).size.width * 0.50,
              child: ElevatedButton(
                // tooltip: '',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BodyWidget()));
                },
                child: Text('Sign In'),
              )),
        )
      ],
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  var _selectedIndex = 0;

  Widget getSelected() {
    switch (_selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return AppointmentList();
      case 2:
        return PatientsList();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(
                  Icons.home,
                ),
                label: Text(
                  "Home",
                ),
              ),
              NavigationRailDestination(
                icon: const Icon(
                  Icons.calendar_today_outlined,
                ),
                selectedIcon: const Icon(Icons.calendar_today_rounded),
                label: Text(
                  "Appointments",
                ),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.person_outline),
                selectedIcon: const Icon(Icons.person),
                label: Text(
                  "Patients",
                ),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
              child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 20.0,
                  color: Colors.amber,
                ),
                Expanded(
                    child: Container(
                  color: Colors.blue,
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
