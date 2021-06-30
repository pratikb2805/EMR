// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'db/patient.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 1248814121182798514),
      name: 'Appointment',
      lastPropertyId: const IdUid(8, 3312974648060697437),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2609080121593456538),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1805414487258815693),
            name: 'patientId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 500431644570760456),
            relationTarget: 'Patient'),
        ModelProperty(
            id: const IdUid(3, 4343847341163028964),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 952489457781810105),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4650093795112956425),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 3970369260571053882),
            name: 'start',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4325795842923743559),
            name: 'end',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 3312974648060697437),
            name: 'description',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 4936362167717958369),
      name: 'Medicine',
      lastPropertyId: const IdUid(5, 8286199679096621062),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1823448384682673520),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3874408323138115538),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7434150344026545178),
            name: 'quantity',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8286199679096621062),
            name: 'prescriptionId',
            type: 11,
            flags: 520,
            indexId: const IdUid(6, 3886321044623268212),
            relationTarget: 'Prescription')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 8251963897192324846),
      name: 'Patient',
      lastPropertyId: const IdUid(10, 234000992791234427),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3692947290945499807),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2330394542641072575),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2730618519850195418),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4400994491909322491),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4058007759877538857),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 1839516504189900705),
            name: 'age',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 2145124522037185566),
            name: 'dateFirstConsult',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 6634717624805223631),
            name: 'dateMostRecentConsult',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 4849749041855598306),
            name: 'diagnosis',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 234000992791234427),
            name: 'dirPath',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(
            name: 'prescription', srcEntity: 'Prescription', srcField: ''),
        ModelBacklink(
            name: 'appointments', srcEntity: 'Appointment', srcField: ''),
        ModelBacklink(name: 'files', srcEntity: 'PatientFile', srcField: ''),
        ModelBacklink(
            name: 'prescriptions', srcEntity: 'Prescription', srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(4, 2839760811986070677),
      name: 'PatientFile',
      lastPropertyId: const IdUid(5, 3451695422816634371),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1629972050052404096),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(2, 7947721494334228708),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(3, 868942308296943115),
            name: 'path',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5903165557457873777),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3451695422816634371),
            name: 'patienttoFileId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 6068866656293643261),
            relationTarget: 'Patient')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 7707797994022277594),
      name: 'Prescription',
      lastPropertyId: const IdUid(4, 520019651782289477),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2876354237212936175),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(3, 9031835638370784499),
            name: 'patientId',
            type: 11,
            flags: 520,
            indexId: const IdUid(7, 1856331240661832129),
            relationTarget: 'Patient'),
        ModelProperty(
            id: const IdUid(4, 520019651782289477),
            name: 'date',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(name: 'medicines', srcEntity: 'Medicine', srcField: '')
      ])
];

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(6, 8529806203100747914),
      lastIndexId: const IdUid(7, 1856331240661832129),
      lastRelationId: const IdUid(4, 3358282934209252739),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [8529806203100747914],
      retiredIndexUids: const [2743594023377116279],
      retiredPropertyUids: const [
        6769734746657577417,
        2355280446903161824,
        4993523017512085499,
        5313318193017040817,
        4618238528276795281,
        2258461996051708361
      ],
      retiredRelationUids: const [
        141024584645410669,
        5094838841494305611,
        3358282934209252739,
        1837215936885163766
      ],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Appointment: EntityDefinition<Appointment>(
        model: _entities[0],
        toOneRelations: (Appointment object) => [object.patient],
        toManyRelations: (Appointment object) => {},
        getId: (Appointment object) => object.id,
        setId: (Appointment object, int id) {
          object.id = id;
        },
        objectToFB: (Appointment object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final phoneOffset = fbb.writeString(object.phone);
          final emailOffset = fbb.writeString(object.email);
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.patient.targetId);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, phoneOffset);
          fbb.addOffset(4, emailOffset);
          fbb.addInt64(5, object.start.millisecondsSinceEpoch);
          fbb.addInt64(6, object.end.millisecondsSinceEpoch);
          fbb.addOffset(7, descriptionOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Appointment(
              start: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0)),
              email:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 12, ''),
              phone:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 10, ''),
              end: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0)),
              description: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 18),
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.patient.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          object.patient.attach(store);
          return object;
        }),
    Medicine: EntityDefinition<Medicine>(
        model: _entities[1],
        toOneRelations: (Medicine object) => [object.prescription],
        toManyRelations: (Medicine object) => {},
        getId: (Medicine object) => object.id,
        setId: (Medicine object, int id) {
          object.id = id;
        },
        objectToFB: (Medicine object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(3, object.quantity);
          fbb.addInt64(4, object.prescription.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Medicine(
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              quantity:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.prescription.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          object.prescription.attach(store);
          return object;
        }),
    Patient: EntityDefinition<Patient>(
        model: _entities[2],
        toOneRelations: (Patient object) => [],
        toManyRelations: (Patient object) => {
              RelInfo<Prescription>.toOneBacklink(3, object.id,
                      (Prescription srcObject) => srcObject.patient):
                  object.prescription,
              RelInfo<Appointment>.toOneBacklink(2, object.id,
                      (Appointment srcObject) => srcObject.patient):
                  object.appointments,
              RelInfo<PatientFile>.toOneBacklink(5, object.id,
                      (PatientFile srcObject) => srcObject.patienttoFile):
                  object.files,
              RelInfo<Prescription>.toOneBacklink(3, object.id,
                      (Prescription srcObject) => srcObject.patient):
                  object.prescriptions
            },
        getId: (Patient object) => object.id,
        setId: (Patient object, int id) {
          object.id = id;
        },
        objectToFB: (Patient object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final addressOffset =
              object.address == null ? null : fbb.writeString(object.address!);
          final emailOffset = fbb.writeString(object.email);
          final phoneOffset = fbb.writeString(object.phone);
          final diagnosisOffset = fbb.writeString(object.diagnosis);
          final dirPathOffset = fbb.writeString(object.dirPath);
          fbb.startTable(11);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, addressOffset);
          fbb.addOffset(3, emailOffset);
          fbb.addOffset(4, phoneOffset);
          fbb.addInt64(5, object.age);
          fbb.addInt64(6, object.dateFirstConsult.millisecondsSinceEpoch);
          fbb.addInt64(7, object.dateMostRecentConsult.millisecondsSinceEpoch);
          fbb.addOffset(8, diagnosisOffset);
          fbb.addOffset(9, dirPathOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Patient(
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              address: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              diagnosis:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 20, ''),
              age: const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0),
              dateFirstConsult: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0)),
              dateMostRecentConsult: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0)),
              email:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 10, ''),
              phone:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 12, ''),
              dirPath:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 22, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          InternalToManyAccess.setRelInfo(
              object.prescription,
              store,
              RelInfo<Prescription>.toOneBacklink(
                  3, object.id, (Prescription srcObject) => srcObject.patient),
              store.box<Patient>());
          InternalToManyAccess.setRelInfo(
              object.appointments,
              store,
              RelInfo<Appointment>.toOneBacklink(
                  2, object.id, (Appointment srcObject) => srcObject.patient),
              store.box<Patient>());
          InternalToManyAccess.setRelInfo(
              object.files,
              store,
              RelInfo<PatientFile>.toOneBacklink(5, object.id,
                  (PatientFile srcObject) => srcObject.patienttoFile),
              store.box<Patient>());
          InternalToManyAccess.setRelInfo(
              object.prescriptions,
              store,
              RelInfo<Prescription>.toOneBacklink(
                  3, object.id, (Prescription srcObject) => srcObject.patient),
              store.box<Patient>());
          return object;
        }),
    PatientFile: EntityDefinition<PatientFile>(
        model: _entities[3],
        toOneRelations: (PatientFile object) => [object.patienttoFile],
        toManyRelations: (PatientFile object) => {},
        getId: (PatientFile object) => object.id,
        setId: (PatientFile object, int id) {
          object.id = id;
        },
        objectToFB: (PatientFile object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final pathOffset = fbb.writeString(object.path);
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          fbb.startTable(6);
          fbb.addOffset(0, nameOffset);
          fbb.addInt64(1, object.id);
          fbb.addOffset(2, pathOffset);
          fbb.addOffset(3, descriptionOffset);
          fbb.addInt64(4, object.patienttoFile.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = PatientFile(
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 4, ''),
              path:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
              description: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 10))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          object.patienttoFile.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          object.patienttoFile.attach(store);
          return object;
        }),
    Prescription: EntityDefinition<Prescription>(
        model: _entities[4],
        toOneRelations: (Prescription object) => [object.patient],
        toManyRelations: (Prescription object) => {
              RelInfo<Medicine>.toOneBacklink(5, object.id,
                      (Medicine srcObject) => srcObject.prescription):
                  object.medicines
            },
        getId: (Prescription object) => object.id,
        setId: (Prescription object, int id) {
          object.id = id;
        },
        objectToFB: (Prescription object, fb.Builder fbb) {
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addInt64(2, object.patient.targetId);
          fbb.addInt64(3, object.date.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Prescription(
              date: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0)))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.patient.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.patient.attach(store);
          InternalToManyAccess.setRelInfo(
              object.medicines,
              store,
              RelInfo<Medicine>.toOneBacklink(
                  5, object.id, (Medicine srcObject) => srcObject.prescription),
              store.box<Prescription>());
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Appointment] entity fields to define ObjectBox queries.
class Appointment_ {
  /// see [Appointment.id]
  static final id =
      QueryIntegerProperty<Appointment>(_entities[0].properties[0]);

  /// see [Appointment.patient]
  static final patient =
      QueryRelationProperty<Appointment, Patient>(_entities[0].properties[1]);

  /// see [Appointment.name]
  static final name =
      QueryStringProperty<Appointment>(_entities[0].properties[2]);

  /// see [Appointment.phone]
  static final phone =
      QueryStringProperty<Appointment>(_entities[0].properties[3]);

  /// see [Appointment.email]
  static final email =
      QueryStringProperty<Appointment>(_entities[0].properties[4]);

  /// see [Appointment.start]
  static final start =
      QueryIntegerProperty<Appointment>(_entities[0].properties[5]);

  /// see [Appointment.end]
  static final end =
      QueryIntegerProperty<Appointment>(_entities[0].properties[6]);

  /// see [Appointment.description]
  static final description =
      QueryStringProperty<Appointment>(_entities[0].properties[7]);
}

/// [Medicine] entity fields to define ObjectBox queries.
class Medicine_ {
  /// see [Medicine.id]
  static final id = QueryIntegerProperty<Medicine>(_entities[1].properties[0]);

  /// see [Medicine.name]
  static final name = QueryStringProperty<Medicine>(_entities[1].properties[1]);

  /// see [Medicine.quantity]
  static final quantity =
      QueryIntegerProperty<Medicine>(_entities[1].properties[2]);

  /// see [Medicine.prescription]
  static final prescription =
      QueryRelationProperty<Medicine, Prescription>(_entities[1].properties[3]);
}

/// [Patient] entity fields to define ObjectBox queries.
class Patient_ {
  /// see [Patient.id]
  static final id = QueryIntegerProperty<Patient>(_entities[2].properties[0]);

  /// see [Patient.name]
  static final name = QueryStringProperty<Patient>(_entities[2].properties[1]);

  /// see [Patient.address]
  static final address =
      QueryStringProperty<Patient>(_entities[2].properties[2]);

  /// see [Patient.email]
  static final email = QueryStringProperty<Patient>(_entities[2].properties[3]);

  /// see [Patient.phone]
  static final phone = QueryStringProperty<Patient>(_entities[2].properties[4]);

  /// see [Patient.age]
  static final age = QueryIntegerProperty<Patient>(_entities[2].properties[5]);

  /// see [Patient.dateFirstConsult]
  static final dateFirstConsult =
      QueryIntegerProperty<Patient>(_entities[2].properties[6]);

  /// see [Patient.dateMostRecentConsult]
  static final dateMostRecentConsult =
      QueryIntegerProperty<Patient>(_entities[2].properties[7]);

  /// see [Patient.diagnosis]
  static final diagnosis =
      QueryStringProperty<Patient>(_entities[2].properties[8]);

  /// see [Patient.dirPath]
  static final dirPath =
      QueryStringProperty<Patient>(_entities[2].properties[9]);
}

/// [PatientFile] entity fields to define ObjectBox queries.
class PatientFile_ {
  /// see [PatientFile.name]
  static final name =
      QueryStringProperty<PatientFile>(_entities[3].properties[0]);

  /// see [PatientFile.id]
  static final id =
      QueryIntegerProperty<PatientFile>(_entities[3].properties[1]);

  /// see [PatientFile.path]
  static final path =
      QueryStringProperty<PatientFile>(_entities[3].properties[2]);

  /// see [PatientFile.description]
  static final description =
      QueryStringProperty<PatientFile>(_entities[3].properties[3]);

  /// see [PatientFile.patienttoFile]
  static final patienttoFile =
      QueryRelationProperty<PatientFile, Patient>(_entities[3].properties[4]);
}

/// [Prescription] entity fields to define ObjectBox queries.
class Prescription_ {
  /// see [Prescription.id]
  static final id =
      QueryIntegerProperty<Prescription>(_entities[4].properties[0]);

  /// see [Prescription.patient]
  static final patient =
      QueryRelationProperty<Prescription, Patient>(_entities[4].properties[1]);

  /// see [Prescription.date]
  static final date =
      QueryIntegerProperty<Prescription>(_entities[4].properties[2]);
}
