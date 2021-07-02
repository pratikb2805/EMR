import 'dart:io';
import 'dart:typed_data';

import 'package:emr/db/db.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path/path.dart' as p;

void savePdf(Patient patient, List<Medicine> medicines) async {
  final doc = await generatePrescription(patient, medicines);
  final dir = p.join(patient.dirPath, "prescription");
  if (!Directory(dir).existsSync()) Directory(dir).createSync();
  final name = DateFormat("dd-MM-yyyy")
          .format(patient.dateMostRecentConsult)
          .toString() +
      ".pdf";
  final String filePath = p.join(dir, name);
  final File file = File(filePath);
  await file.writeAsBytes(doc);
}

Future<Uint8List> generatePrescription(
    Patient patient, List<Medicine> medicines) async {
  Doctor? doctor = await Doctor.fromSharedPref();

  print(medicines.length);
  final prescription = PrescriptionPdf(
      prescriptionNumber: patient.prescriptions.length.toString(),
      medicines: medicines,
      patientName: patient.name,
      email: patient.email,
      phoneNo: patient.phone,
      date: DateFormat("dd-MM-yyyy")
          .format(patient.dateMostRecentConsult)
          .toString(),
      age: patient.age,
      baseColor: PdfColors.teal,
      accentColor: PdfColors.blueGrey900,
      doctor: doctor);

  return await prescription.buildPdf();
}

class PrescriptionPdf {
  PrescriptionPdf({
    required this.medicines,
    required this.patientName,
    required this.phoneNo,
    required this.email,
    required this.date,
    required this.age,
    required this.prescriptionNumber,
    required this.baseColor,
    required this.accentColor,
    required this.doctor,
  });

  final List<Medicine> medicines;
  final String patientName;
  final String phoneNo;
  final String email;
  final String date;
  final int age;
  final String prescriptionNumber;
  final PdfColor baseColor;
  final PdfColor accentColor;
  final Doctor? doctor;

  static const _darkColor = PdfColors.blueGrey800;
  static const _lightColor = PdfColors.white;

  PdfColor get _baseTextColor => baseColor.isLight ? _lightColor : _darkColor;

  Future<Uint8List> buildPdf() async {
    final doc = pw.Document();

    doc.addPage(
      pw.MultiPage(
        pageTheme: _buildTheme(),
        header: _buildHeader,
        footer: _buildFooter,
        build: (context) => [
          _contentHeader(context),
          _contentTable(context),
          pw.SizedBox(height: 20),
          _contentFooter(context),
          pw.SizedBox(height: 20),
          _termsAndConditions(context),
        ],
      ),
    );

    return doc.save();
  }

  pw.Widget _buildHeader(pw.Context context) {
    return pw.Column(
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
          children: [
            pw.Container(
              height: 50,
              padding: const pw.EdgeInsets.only(left: 20),
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                doctor!.displayname + "'s Clinic",
                style: pw.TextStyle(
                  color: baseColor,
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            pw.Container(
              alignment: pw.Alignment.centerRight,
              padding: const pw.EdgeInsets.only(bottom: 6, left: 20),
              height: 50,
              child: pw.PdfLogo(),
            ),
          ],
        ),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Container(
            padding: const pw.EdgeInsets.only(
                left: 40, top: 10, bottom: 0, right: 20),
            alignment: pw.Alignment.centerLeft,
            height: 60,
            child: pw.DefaultTextStyle(
                style: pw.TextStyle(
                  color: _darkColor,
                  fontSize: 12,
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(doctor!.displayname),
                    pw.Text(doctor!.qualifications == null
                        ? "MBBS MD"
                        : doctor!.qualifications!.join(" ")),
                  ],
                )),
          ),
          pw.Container(
            padding: const pw.EdgeInsets.only(
                left: 40, top: 10, bottom: 0, right: 20),
            alignment: pw.Alignment.centerLeft,
            height: 60,
            child: pw.DefaultTextStyle(
                style: pw.TextStyle(
                  color: _darkColor,
                  fontSize: 12,
                ),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(doctor!.address != null
                          ? doctor!.address!
                          : 'Jhansi Rani Chow'),
                      pw.Text(doctor!.email),
                      pw.Text(doctor!.phone)
                    ])),
          ),
        ]),
        pw.Divider(color: baseColor),
        if (context.pageNumber > 1) pw.SizedBox(height: 20)
      ],
    );
  }

  pw.Widget _buildFooter(pw.Context context) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Container(
          height: 20,
          width: 100,
          child: pw.BarcodeWidget(
            barcode: pw.Barcode.pdf417(),
            data: 'Prescription# $prescriptionNumber',
            drawText: false,
          ),
        ),
        pw.Text(
          'Page ${context.pageNumber}/${context.pagesCount}',
          style: const pw.TextStyle(
            fontSize: 12,
            color: PdfColors.white,
          ),
        ),
      ],
    );
  }

  pw.PageTheme _buildTheme() {
    return pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      buildBackground: (context) => pw.FullPage(
        ignoreMargins: true,
      ),
    );
  }

  pw.Widget _contentHeader(pw.Context context) {
    return pw
        .Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
      pw.Container(
        padding:
            const pw.EdgeInsets.only(left: 40, top: 10, bottom: 10, right: 20),
        alignment: pw.Alignment.centerLeft,
        height: 60,
        child: pw.DefaultTextStyle(
            style: pw.TextStyle(
              color: _darkColor,
              fontSize: 12,
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text("Patient Name : $patientName"),
                pw.Text("Age : $age"),
              ],
            )),
      ),
      pw.Container(
        padding:
            const pw.EdgeInsets.only(left: 40, top: 10, bottom: 10, right: 20),
        alignment: pw.Alignment.centerLeft,
        height: 60,
        child: pw.DefaultTextStyle(
            style: pw.TextStyle(
              color: _darkColor,
              fontSize: 12,
            ),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text("Phone No. : $phoneNo"),
                  pw.Text("Email : $email"),
                  pw.Text("Date : $date")
                ])),
      ),
    ]);
  }

  pw.Widget _contentFooter(pw.Context context) {
    return pw.Container(
      child: pw.Text(
        'Thank you for Visiting \n Stay Healthy Stay Safe',
        style: pw.TextStyle(
          color: _darkColor,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
    );
  }

  pw.Widget _termsAndConditions(pw.Context context) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                decoration: pw.BoxDecoration(
                  border: pw.Border(top: pw.BorderSide(color: accentColor)),
                ),
                padding: const pw.EdgeInsets.only(top: 10, bottom: 4),
                child: pw.Text(
                  'Terms & Conditions',
                  style: pw.TextStyle(
                    fontSize: 12,
                    color: baseColor,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.Text(
                pw.LoremText().paragraph(40),
                textAlign: pw.TextAlign.justify,
                style: const pw.TextStyle(
                  fontSize: 6,
                  lineSpacing: 2,
                  color: _darkColor,
                ),
              ),
            ],
          ),
        ),
        pw.Expanded(
          child: pw.SizedBox(),
        ),
      ],
    );
  }

  String getIndex(int row, int col) {
    switch (col) {
      case 0:
        return (row + 1).toString();
      case 1:
        return medicines[row].name;
      case 2:
        return medicines[row].quantity.toString();
      default:
        return '';
    }
  }

  pw.Widget _contentTable(pw.Context context) {
    const tableHeaders = ['Index', 'Medicine Name', 'Quantity'];

    return pw.Table.fromTextArray(
      border: null,
      cellAlignment: pw.Alignment.centerLeft,
      headerDecoration: pw.BoxDecoration(
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
        color: baseColor,
      ),
      headerHeight: 25,
      cellHeight: 30,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.center,
      },
      headerStyle: pw.TextStyle(
        color: _baseTextColor,
        fontSize: 10,
        fontWeight: pw.FontWeight.bold,
      ),
      cellStyle: const pw.TextStyle(
        color: _darkColor,
        fontSize: 10,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: accentColor,
            width: .5,
          ),
        ),
      ),
      headers: List<String>.generate(
        tableHeaders.length,
        (col) => tableHeaders[col],
      ),
      data: List<List<String>>.generate(
        medicines.length,
        (row) => List<String>.generate(
          tableHeaders.length,
          (col) => getIndex(row, col),
        ),
      ),
    );
  }
}
