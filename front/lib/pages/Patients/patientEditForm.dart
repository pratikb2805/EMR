import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:emr/db/db.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:emr/pages/pages.dart';
import 'package:path/path.dart' as p;

class PatientEditForm extends StatefulWidget {
  final Appointment appointment;
  PatientEditForm(this.appointment);
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

  static List<List<dynamic>> medicinesList = [
    ['', '']
  ];

  Patient? patient;
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
    medicinesList = [
      ['', '']
    ];
    super.dispose();
  }

  @override
  void initState() {
    if (widget.appointment.patient.target == null) {
      print("not exist");
      _name.text = widget.appointment.name;
      _email.text = widget.appointment.email;
      _phoneNo.text = widget.appointment.phone;
    } else {
      print("exist");
      _name.text = widget.appointment.patient.target!.name;
      _address.text = ((widget.appointment.patient.target!.address != null)
          ? widget.appointment.patient.target!.address
          : '')!;
      _discription.text = widget.appointment.patient.target!.diagnosis;
      _phoneNo.text = widget.appointment.patient.target!.phone;
      _email.text = widget.appointment.patient.target!.email;
    }
    _lastVisitedDateCtl.text =
        DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();

    super.initState();
  }

  void savePrescription(Patient patientTemp, PatientModel pm) async {
    final dirPath = p.join(
        p.join((await getApplicationSupportDirectory()).path, 'patientfiles'),
        (patientTemp.id).toString());
    final presPath = p.join(
        p.join(dirPath, 'prescription'),
        DateFormat("dd-MM-yyyy")
                .format(patientTemp.dateMostRecentConsult)
                .toString() +
            '.pdf');
    Prescription prescription = Prescription(
        date: patientTemp.dateMostRecentConsult, filePath: presPath);
    for (int i = 0; i < medicinesList.length; i++) {
      String name = medicinesList[i][0];
      String quantity = medicinesList[i][1];
      if (name != '' && quantity != '') {
        Medicine medicine = Medicine(name: name, quantity: int.parse(quantity));
        prescription.medicines.add(medicine);
      }
    }
    savePdf(patientTemp, prescription.medicines.toList());
    patientTemp.prescriptions.add(prescription);
    pm.addPatient(patientTemp);
  }

  List<Widget> _getMedicines() {
    List<Widget> medicinesTextFieldsList = [];
    for (int i = 0; i < medicinesList.length; i++) {
      medicinesTextFieldsList.add(
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
                _addRemoveButton(i == medicinesList.length - 1, i),
              ],
            )),
      );
    }
    return medicinesTextFieldsList;
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          medicinesList.insert(medicinesList.length, ['', '']);
        } else
          medicinesList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? FluentIcons.add_24_regular : FluentIcons.subtract_24_regular,
          color: Colors.black,
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
                      Expanded(
                        child: Card(
                          elevation: 5,
                          margin: EdgeInsets.all(10),
                          child: Container(
                              height: 275,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TitleWidget(title: "Personal Details"),
                                  TextInputOneLineWidget(
                                      controller: _name, label: "Name"),
                                  TextInputOneLineWidget(
                                      controller: _age, label: "Age")
                                ],
                              )),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 5,
                          margin: EdgeInsets.all(10),
                          child: Container(
                              height: 275,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 5,
                          margin: EdgeInsets.all(10),
                          child: Container(
                              height: 275,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TitleWidget(title: "Appointments"),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: TextFormField(
                                        readOnly: true,
                                        controller: _nextAppointmentDate,
                                        decoration: InputDecoration(
                                            suffixIcon:
                                                Icon(Icons.calendar_today),
                                            labelText: "Next Appointment Date",
                                            border: OutlineInputBorder()),
                                        onTap: () async {
                                          var date = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2100));
                                          _nextAppointmentDate.text =
                                              date != null
                                                  ? DateFormat('dd-MM-yyyy')
                                                      .format(date)
                                                      .toString()
                                                  : '';
                                        },
                                      )),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: TextFormField(
                                        readOnly: true,
                                        controller: _lastVisitedDateCtl,
                                        decoration: InputDecoration(
                                            labelText: "Date of Appointment",
                                            border: OutlineInputBorder()),
                                      ))
                                ],
                              )),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 5,
                          margin: EdgeInsets.all(10),
                          child: Container(
                              height: 275,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                        ),
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
                              ..._getMedicines()
                            ],
                          ))),
                ],
              ))),
      title: Center(
        child: Text("Patient Info"),
      ),
      actions: <Widget>[
        Center(
          child: Consumer<PatientModel>(
            builder: (context, pm, child) => Consumer<AppointmentModel>(
              builder: (context, am, child) => ElevatedButton(
                onPressed: () async {
                  if (_patientEditFormKey.currentState!.validate()) {
                    if (widget.appointment.patient.target == null &&
                        patient == null) {
                      patient = Patient(
                          name: _name.text,
                          age: int.parse(_age.text),
                          diagnosis: _discription.text,
                          dateFirstConsult: widget.appointment.start,
                          dateMostRecentConsult: widget.appointment.start,
                          email: _email.text,
                          phone: _phoneNo.text);
                    } else {
                      patient = widget.appointment.patient.target!;
                      patient!.dateMostRecentConsult = widget.appointment.start;
                    }
                    pm.addPatient(patient!);

                    savePrescription(patient!, pm);

                    am.removeAppointment(widget.appointment);

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
      _nameController.text =
          _PatientEditFormState.medicinesList[widget.index][0];
    });
    return TextFormField(
      controller: _nameController,
      onChanged: (v) =>
          _PatientEditFormState.medicinesList[widget.index][0] = v,
      decoration: InputDecoration(
          border: OutlineInputBorder(), labelText: 'Enter Medicine Name'),
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
      _quantity.text = _PatientEditFormState.medicinesList[widget.index][1];
    });
    return TextFormField(
        onChanged: (v) =>
            _PatientEditFormState.medicinesList[widget.index][1] = v,
        controller: _quantity,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        decoration: InputDecoration(
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
              labelText: widget.label, border: OutlineInputBorder()),
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
              labelText: widget.label, border: OutlineInputBorder()),
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
