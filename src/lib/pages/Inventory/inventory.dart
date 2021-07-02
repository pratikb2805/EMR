import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'dart:math';
import 'package:emr/db/db.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as Fluent;
import 'package:another_flushbar/flushbar.dart';

import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class MedicineListEntityList extends StatefulWidget {
  @override
  _MedicineListEntityListState createState() => _MedicineListEntityListState();
}

class _MedicineListEntityListState extends State<MedicineListEntityList> {
  bool hasBeenInitialized = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      hasBeenInitialized = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              height: max(MediaQuery.of(context).size.height * 0.1, 70),
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Medicine List",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
                height: max(MediaQuery.of(context).size.height * 0.07, 40),
                color: Fluent.FluentTheme.of(context).accentColor,
                child: TextButton.icon(
                    onPressed: () async {
                      Fluent.showDialog(
                        context: context,
                        builder: (context) {
                          return NewMedicine();
                        },
                      );
                    },
                    icon: Fluent.Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(FluentIcons.add_24_regular,
                          color: Colors.white),
                    ),
                    label: Fluent.Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Add to store",
                          style: TextStyle(color: Colors.white)),
                    )))
          ]),
          Consumer<MedicineModel>(
            builder: (context, model, child) {
              return MedicineListEntityDataTable(
                MedicineListEntitys: model.medicines,
                vm: model,
              );
            },
          ),
        ],
      ),
    );
  }
}

class NewMedicine extends StatefulWidget {
  NewMedicine({Key? key}) : super(key: key);

  @override
  _NewMedicineState createState() => _NewMedicineState();
}

class _NewMedicineState extends State<NewMedicine> {
  String? type;
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final provider = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Fluent.ContentDialog(
        actions: [
          Consumer<MedicineModel>(
            builder: (context, model, child) => TextButton.icon(
              icon: Icon(FluentIcons.checkmark_24_regular, color: Colors.black),
              label: Text('Add',
                  style: Fluent.FluentTheme.of(context).typography.subtitle),
              onPressed: () {
                if (nameController.text.isEmpty ||
                    provider.text.isEmpty ||
                    type == null) {
                  Flushbar(
                    message: 'Please fill out all fields',
                    mainButton: Fluent.TextButton(
                      child: Text(
                        'Back',
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    duration: Duration(seconds: 3),
                  )..show(context);
                } else {
                  model.addMedicine(MedicineListEntity(
                      name: nameController.text,
                      provider: provider.text,
                      type: type!));
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          TextButton.icon(
            icon: Icon(FluentIcons.dismiss_24_regular, color: Colors.black),
            label: Text(
              'Cancel',
              style: Fluent.FluentTheme.of(context).typography.subtitle,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
        title: Text(
          'Add a medicine',
          style: Fluent.FluentTheme.of(context).typography.subtitle,
        ),
        content: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Fluent.TextBox(
                        controller: nameController,
                        header: 'Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Fluent.TextBox(
                      controller: provider,
                      header: 'Provider',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      child: DropdownButton<String>(
                        icon: const Icon(
                            FluentIcons.arrow_hook_down_left_20_regular,
                            color: Colors.black),
                        value: type,
                        hint: Text(type ?? 'Selected list item'),
                        onChanged: (String? val) {
                          if (val != null)
                            setState(() {
                              type = val;
                            });
                        },
                        items: <String>['Tablet', 'Syrup', 'Ointment']
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicineListEntityDataTable extends StatefulWidget {
  final List<MedicineListEntity> MedicineListEntitys;
  final MedicineModel vm;
  MedicineListEntityDataTable(
      {Key? key, required this.MedicineListEntitys, required this.vm})
      : super(key: key);

  @override
  _MedicineListEntityDataTableState createState() =>
      _MedicineListEntityDataTableState();
}

class _MedicineListEntityDataTableState
    extends State<MedicineListEntityDataTable> {
  late MedicineListEntityDataSource _source;
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  bool isLoaded = false;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  List<MedicineListEntity> MedicineListEntitys = [];

  void _sort<T>(Comparable<T> getField(MedicineListEntity d), int columnIndex,
      bool ascending) {
    _source._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  void getData() {
    setState(() {
      MedicineListEntitys = widget.MedicineListEntitys;
      _source = MedicineListEntityDataSource(MedicineListEntitys, widget.vm);
    });
  }

  void initstate() {
    setState(() {
      MedicineListEntitys = widget.MedicineListEntitys;
      _source = MedicineListEntityDataSource(MedicineListEntitys, widget.vm);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return SingleChildScrollView(
      child: PaginatedDataTable(
        source: _source,
        rowsPerPage: _rowsPerPage,
        sortAscending: _sortAscending,
        sortColumnIndex: _sortColumnIndex,
        availableRowsPerPage: [10, 20, 30, 50],
        showFirstLastButtons: true,
        onRowsPerPageChanged: (newRowsPerPage) {
          setState(() {
            _rowsPerPage = newRowsPerPage!;
          });
        },
        columns: [
          DataColumn(
              numeric: true,
              label: Text(
                'ID',
                style: Fluent.FluentTheme.of(context)
                    .typography
                    .body!
                    .apply(fontSizeDelta: 2, fontWeightDelta: 2),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<num>(
                  (MedicineListEntity d) => d.id, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Name',
                style: Fluent.FluentTheme.of(context)
                    .typography
                    .body!
                    .apply(fontSizeDelta: 2, fontWeightDelta: 2),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (MedicineListEntity d) => d.name, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Type',
                style: Fluent.FluentTheme.of(context)
                    .typography
                    .body!
                    .apply(fontSizeDelta: 2, fontWeightDelta: 2),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (MedicineListEntity d) => d.type, columnIndex, ascending)),
          DataColumn(
              label: Text(
                'Provider',
                style: Fluent.FluentTheme.of(context)
                    .typography
                    .body!
                    .apply(fontSizeDelta: 2, fontWeightDelta: 2),
              ),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (MedicineListEntity d) => d.provider,
                  columnIndex,
                  ascending)),
          DataColumn(
              label: Text(
                'Actions',
                style: Fluent.FluentTheme.of(context)
                    .typography
                    .body!
                    .apply(fontSizeDelta: 2, fontWeightDelta: 2),
              ),
              onSort: (int columnIndex, bool ascending) => {}),
        ],
      ),
    );
  }
}

class MedicineListEntityDataSource extends DataTableSource {
  final List<MedicineListEntity> _MedicineListEntity;
  final MedicineModel vm;
  MedicineListEntityDataSource(this._MedicineListEntity, this.vm);

  void _sort<T>(Comparable<T> getField(MedicineListEntity d), bool ascending) {
    _MedicineListEntity.sort((MedicineListEntity a, MedicineListEntity b) {
      if (!ascending) {
        final MedicineListEntity c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    final med = _MedicineListEntity[index];
    return DataRow(cells: [
      DataCell(Text(med.id.toString())),
      DataCell(TextFormField(
        initialValue: med.name,
        onFieldSubmitted: (val) {
          med.name = val;
          vm.addMedicine(med);
          print('done');
        },
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(enabled: false),
        initialValue: med.type,
        onChanged: (val) {
          med.name = val;
          vm.addMedicine(med);
          print('done');
        },
      )),
      DataCell(TextFormField(
        initialValue: med.provider,
        onChanged: (val) {
          med.provider = val;
          vm.addMedicine(med);
          print('done');
        },
      )),
      DataCell(IconButton(
        onPressed: () {
          vm.removeMedicine(med);
        },
        icon: Icon(FluentIcons.delete_24_regular, color: Colors.black),
      ))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _MedicineListEntity.length;

  @override
  int get selectedRowCount => 0;
}
