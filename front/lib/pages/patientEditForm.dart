import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'pages.dart';
import 'dart:io';

class PatientEditForm extends StatefulWidget {
  final Patient patient;
  PatientEditForm(this.patient);
  @override
  _PatientEditFormState createState() => _PatientEditFormState();
}

class _PatientEditFormState extends State<PatientEditForm> {
  final GlobalKey<FormState> _patientEditFormKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _discription = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _lastVisitedDateCtl = TextEditingController();
  final TextEditingController _nextAppointmentDate = TextEditingController();
  final TextEditingController _thingsToWork = TextEditingController();

  static List<List<dynamic>> friendsList = [
    ['', '']
  ];

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _email.dispose();
    _phoneNo.dispose();
    _discription.dispose();
    _address.dispose();
    _nextAppointmentDate.dispose();
    _thingsToWork.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _name.text = widget.patient.companyName;
    _lastVisitedDateCtl.text =
        DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();

    super.initState();
  }

  // void printLatest() {
  //   print('UserName : ${_discription.text}');
  // }

  List<Widget> _getFriends() {
    List<Widget> friendsTextFieldsList = [];
    for (int i = 0; i < friendsList.length; i++) {
      friendsTextFieldsList.add(
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(flex: 6, child: MedicineInputField(i)),
                SizedBox(
                  width: 10,
                ),
                Expanded(flex: 2, child: QuantityInputField(i)),
                SizedBox(
                  width: 16,
                ),
                _addRemoveButton(i == friendsList.length - 1, i),
              ],
            )),
      );
    }
    return friendsTextFieldsList;
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          friendsList.insert(friendsList.length, ['', '']);
        } else
          friendsList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Form(
          key: _patientEditFormKey,
          child: Container(
              width: 900,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Container(
                            height: 275,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TitleWidget(title: "Personal Details"),
                                TextInputOneLineWidget(
                                    controller: _name, label: "Name"),
                                TextInputOneLineWidget(
                                    controller: _age, label: "Age")
                              ],
                            )),
                      ),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Container(
                            height: 275,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TitleWidget(title: "Contact Details"),
                                TextInputOneLineWidget(
                                    controller: _phoneNo, label: "Phone No."),
                                TextInputOneLineWidget(
                                    controller: _email, label: "Email"),
                                TextInputMultiLineWidget(
                                    controller: _address,
                                    label: "Address",
                                    maxHeight: 100),
                              ],
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Container(
                            height: 275,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TitleWidget(title: "Appointments"),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: _nextAppointmentDate,
                                      decoration: InputDecoration(
                                          suffixIcon:
                                              Icon(Icons.calendar_today),
                                          constraints:
                                              BoxConstraints(maxHeight: 45),
                                          labelText: "Next Appointment Date",
                                          border: OutlineInputBorder()),
                                      onTap: () async {
                                        var date = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2100));
                                        _nextAppointmentDate.text = date != null
                                            ? DateFormat('dd-MM-yyyy')
                                                .format(date)
                                                .toString()
                                            : '';
                                      },
                                    )),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: _lastVisitedDateCtl,
                                      decoration: InputDecoration(
                                          constraints:
                                              BoxConstraints(maxHeight: 45),
                                          labelText: "Date of Appointment",
                                          border: OutlineInputBorder()),
                                    ))
                              ],
                            )),
                      ),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Container(
                            height: 275,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TitleWidget(title: "Medical Details"),
                                TextInputMultiLineWidget(
                                    controller: _discription,
                                    label: "Description",
                                    maxHeight: 100),
                                TextInputMultiLineWidget(
                                    controller: _thingsToWork,
                                    label: "Things to work on",
                                    maxHeight: 100)
                              ],
                            )),
                      )
                    ],
                  ),
                  Card(
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.63,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Pharmacy Prescription",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ..._getFriends()
                            ],
                          ))),

                  // FloatingActionButton(onPressed: () {
                  //   final file = OpenFilePicker();
                  //   file.hidePinnedPlaces = true;
                  //   file.forcePreviewPaneOn = true;
                  //   file.filterSpecification = {
                  //     'JPEG Files': '*.jpg;*.jpeg',
                  //     'Bitmap Files': '*.bmp',
                  //     'All Files (*.*)': '*.*'
                  //   };
                  //   file.title = 'Select an image';
                  //   final result = file.getFile();
                  //   if (result != null) {
                  //     setState(() {
                  //       path = result as File?;
                  //     });
                  //   }
                  //   ;
                  // })
                ],
              ))),
      title: Center(
        child: Text("Patient Info"),
      ),
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            onPressed: () {
              if (_patientEditFormKey.currentState!.validate()) {
                // Do something like updating SharedPreferences or User Settings etc.
                Navigator.of(context).pop();
              }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 100,
              height: 40,
              child: Text("Submit"),
            ),
          ),
        ),
      ],
    );
  }
}

class MedicineInputField extends StatefulWidget {
  final int index;
  MedicineInputField(this.index);
  @override
  _MedicineInputFieldState createState() => _MedicineInputFieldState();
}

class _MedicineInputFieldState extends State<MedicineInputField> {
  final TextEditingController _nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _nameController.text = _PatientEditFormState.friendsList[widget.index][0];
    });
    return TextFormField(
      controller: _nameController,
      // save text field data in friends list at index
      // whenever text field value changes
      onChanged: (v) => _PatientEditFormState.friendsList[widget.index][0] = v,
      decoration: InputDecoration(
          constraints: BoxConstraints(maxHeight: 45),
          border: OutlineInputBorder(),
          labelText: 'Enter Medicine Name'),
      validator: (v) {
        if (v!.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}

class QuantityInputField extends StatefulWidget {
  final int index;
  QuantityInputField(this.index);
  @override
  _QuantityInputFieldState createState() => _QuantityInputFieldState();
}

class _QuantityInputFieldState extends State<QuantityInputField> {
  final TextEditingController _quantity = TextEditingController();
  @override
  void initState() {
    _quantity.text = '0';
    super.initState();
  }

  @override
  void dispose() {
    _quantity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _quantity.text = _PatientEditFormState.friendsList[widget.index][1];
    });
    return TextFormField(
        onChanged: (v) =>
            _PatientEditFormState.friendsList[widget.index][1] = v,
        controller: _quantity,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        decoration: InputDecoration(
          constraints: BoxConstraints(maxHeight: 45),
          border: OutlineInputBorder(),
          labelText: "Quanitity",
        ));
  }
}

class TextInputOneLineWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  TextInputOneLineWidget(
      {Key? key, required this.controller, required this.label})
      : super(key: key);
  @override
  _TextInputOneLineWidgetState createState() => _TextInputOneLineWidgetState();
}

class _TextInputOneLineWidgetState extends State<TextInputOneLineWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        width: MediaQuery.of(context).size.width * 0.3,
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              constraints: BoxConstraints(maxHeight: 45),
              labelText: widget.label,
              border: OutlineInputBorder()),
        ));
  }
}

class TextInputMultiLineWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final double maxHeight;
  TextInputMultiLineWidget(
      {Key? key,
      required this.controller,
      required this.label,
      required this.maxHeight})
      : super(key: key);
  @override
  _TextInputMultiLineWidgetState createState() =>
      _TextInputMultiLineWidgetState();
}

class _TextInputMultiLineWidgetState extends State<TextInputMultiLineWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        width: MediaQuery.of(context).size.width * 0.3,
        child: TextField(
          maxLines: null,
          controller: widget.controller,
          decoration: InputDecoration(
              constraints: BoxConstraints(maxHeight: widget.maxHeight),
              labelText: widget.label,
              border: OutlineInputBorder()),
        ));
  }
}

class TitleWidget extends StatefulWidget {
  final String title;
  TitleWidget({Key? key, required this.title}) : super(key: key);
  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      alignment: Alignment.centerLeft,
      child: Text(
        widget.title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}