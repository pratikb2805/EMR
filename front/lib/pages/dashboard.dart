import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          color: Colors.purple,
          height: 80.0,
          width: double.infinity,
          child: Center(
            child: Text(
              'Dashboard',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Container(
                // Sidebar
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.2),
            Container(
              // dashboard
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // profile photo
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10.0)),
                          height: 250.0,
                          width: 250.0,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.0)),
                            height: 250.0,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
