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
      id: const IdUid(1, 980207476511745499),
      name: 'Appointment',
      lastPropertyId: const IdUid(8, 2462211432531836962),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1432217913924758625),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8547959311044732001),
            name: 'patientId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 4964824786930614709),
            relationTarget: 'Patient'),
        ModelProperty(
            id: const IdUid(3, 2729283352043843406),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4218355714880945287),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1292040813197140458),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7223382681417688374),
            name: 'start',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 332689886567221488),
            name: 'end',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 2462211432531836962),
            name: 'description',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 1081398232892878123),
      name: 'Medicine',
      lastPropertyId: const IdUid(4, 3900349319257525067),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 638353958845560741),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7472851359015801325),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7972133536552691445),
            name: 'quantity',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3900349319257525067),
            name: 'prescriptionId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 1720417996275521020),
            relationTarget: 'Prescription')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 8597768092526273925),
      name: 'MedicineListEntity',
      lastPropertyId: const IdUid(4, 743575235905870374),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1421541099554690973),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8077515789044744813),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8717748664895124499),
            name: 'provider',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 743575235905870374),
            name: 'type',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 8865348481158784631),
      name: 'Patient',
      lastPropertyId: const IdUid(10, 5646735255928587887),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2777689438493610214),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1076024628369631315),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8804620599790315932),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4304685712616014293),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1317978659662726173),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 1399891960379675339),
            name: 'age',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 8383230599807642661),
            name: 'dateFirstConsult',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 1474716533548285583),
            name: 'dateMostRecentConsult',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 1102640712795796689),
            name: 'diagnosis',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 5646735255928587887),
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
      id: const IdUid(5, 3249343592798703606),
      name: 'PatientFile',
      lastPropertyId: const IdUid(5, 3362574328434198541),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7108493623161059885),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(2, 3366081390455799508),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(3, 2518794000975027046),
            name: 'path',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4321005066649071984),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3362574328434198541),
            name: 'patienttoFileId',
            type: 11,
            flags: 520,
            indexId: const IdUid(3, 6935521076521674077),
            relationTarget: 'Patient')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(6, 1551578526507179291),
      name: 'Prescription',
      lastPropertyId: const IdUid(4, 6694266175318252090),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8284373219759734684),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 374431922059084320),
            name: 'patientId',
            type: 11,
            flags: 520,
            indexId: const IdUid(4, 4195167626136902105),
            relationTarget: 'Patient'),
        ModelProperty(
            id: const IdUid(3, 6169972770310103158),
            name: 'filePath',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6694266175318252090),
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
      lastEntityId: const IdUid(6, 1551578526507179291),
      lastIndexId: const IdUid(4, 4195167626136902105),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
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
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.quantity);
          fbb.addInt64(3, object.prescription.targetId);
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
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.prescription.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.prescription.attach(store);
          return object;
        }),
    MedicineListEntity: EntityDefinition<MedicineListEntity>(
        model: _entities[2],
        toOneRelations: (MedicineListEntity object) => [],
        toManyRelations: (MedicineListEntity object) => {},
        getId: (MedicineListEntity object) => object.id,
        setId: (MedicineListEntity object, int id) {
          object.id = id;
        },
        objectToFB: (MedicineListEntity object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final providerOffset = fbb.writeString(object.provider);
          final typeOffset = fbb.writeString(object.type);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, providerOffset);
          fbb.addOffset(3, typeOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = MedicineListEntity(
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              provider:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
              type:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 10, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    Patient: EntityDefinition<Patient>(
        model: _entities[3],
        toOneRelations: (Patient object) => [],
        toManyRelations: (Patient object) => {
              RelInfo<Prescription>.toOneBacklink(2, object.id,
                      (Prescription srcObject) => srcObject.patient):
                  object.prescription,
              RelInfo<Appointment>.toOneBacklink(2, object.id,
                      (Appointment srcObject) => srcObject.patient):
                  object.appointments,
              RelInfo<PatientFile>.toOneBacklink(5, object.id,
                      (PatientFile srcObject) => srcObject.patienttoFile):
                  object.files,
              RelInfo<Prescription>.toOneBacklink(2, object.id,
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
                  2, object.id, (Prescription srcObject) => srcObject.patient),
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
                  2, object.id, (Prescription srcObject) => srcObject.patient),
              store.box<Patient>());
          return object;
        }),
    PatientFile: EntityDefinition<PatientFile>(
        model: _entities[4],
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
        model: _entities[5],
        toOneRelations: (Prescription object) => [object.patient],
        toManyRelations: (Prescription object) => {
              RelInfo<Medicine>.toOneBacklink(4, object.id,
                      (Medicine srcObject) => srcObject.prescription):
                  object.medicines
            },
        getId: (Prescription object) => object.id,
        setId: (Prescription object, int id) {
          object.id = id;
        },
        objectToFB: (Prescription object, fb.Builder fbb) {
          final filePathOffset = fbb.writeString(object.filePath);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.patient.targetId);
          fbb.addOffset(2, filePathOffset);
          fbb.addInt64(3, object.date.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Prescription(
              date: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0)),
              filePath:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.patient.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          object.patient.attach(store);
          InternalToManyAccess.setRelInfo(
              object.medicines,
              store,
              RelInfo<Medicine>.toOneBacklink(
                  4, object.id, (Medicine srcObject) => srcObject.prescription),
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

/// [MedicineListEntity] entity fields to define ObjectBox queries.
class MedicineListEntity_ {
  /// see [MedicineListEntity.id]
  static final id =
      QueryIntegerProperty<MedicineListEntity>(_entities[2].properties[0]);

  /// see [MedicineListEntity.name]
  static final name =
      QueryStringProperty<MedicineListEntity>(_entities[2].properties[1]);

  /// see [MedicineListEntity.provider]
  static final provider =
      QueryStringProperty<MedicineListEntity>(_entities[2].properties[2]);

  /// see [MedicineListEntity.type]
  static final type =
      QueryStringProperty<MedicineListEntity>(_entities[2].properties[3]);
}

/// [Patient] entity fields to define ObjectBox queries.
class Patient_ {
  /// see [Patient.id]
  static final id = QueryIntegerProperty<Patient>(_entities[3].properties[0]);

  /// see [Patient.name]
  static final name = QueryStringProperty<Patient>(_entities[3].properties[1]);

  /// see [Patient.address]
  static final address =
      QueryStringProperty<Patient>(_entities[3].properties[2]);

  /// see [Patient.email]
  static final email = QueryStringProperty<Patient>(_entities[3].properties[3]);

  /// see [Patient.phone]
  static final phone = QueryStringProperty<Patient>(_entities[3].properties[4]);

  /// see [Patient.age]
  static final age = QueryIntegerProperty<Patient>(_entities[3].properties[5]);

  /// see [Patient.dateFirstConsult]
  static final dateFirstConsult =
      QueryIntegerProperty<Patient>(_entities[3].properties[6]);

  /// see [Patient.dateMostRecentConsult]
  static final dateMostRecentConsult =
      QueryIntegerProperty<Patient>(_entities[3].properties[7]);

  /// see [Patient.diagnosis]
  static final diagnosis =
      QueryStringProperty<Patient>(_entities[3].properties[8]);

  /// see [Patient.dirPath]
  static final dirPath =
      QueryStringProperty<Patient>(_entities[3].properties[9]);
}

/// [PatientFile] entity fields to define ObjectBox queries.
class PatientFile_ {
  /// see [PatientFile.name]
  static final name =
      QueryStringProperty<PatientFile>(_entities[4].properties[0]);

  /// see [PatientFile.id]
  static final id =
      QueryIntegerProperty<PatientFile>(_entities[4].properties[1]);

  /// see [PatientFile.path]
  static final path =
      QueryStringProperty<PatientFile>(_entities[4].properties[2]);

  /// see [PatientFile.description]
  static final description =
      QueryStringProperty<PatientFile>(_entities[4].properties[3]);

  /// see [PatientFile.patienttoFile]
  static final patienttoFile =
      QueryRelationProperty<PatientFile, Patient>(_entities[4].properties[4]);
}

/// [Prescription] entity fields to define ObjectBox queries.
class Prescription_ {
  /// see [Prescription.id]
  static final id =
      QueryIntegerProperty<Prescription>(_entities[5].properties[0]);

  /// see [Prescription.patient]
  static final patient =
      QueryRelationProperty<Prescription, Patient>(_entities[5].properties[1]);

  /// see [Prescription.filePath]
  static final filePath =
      QueryStringProperty<Prescription>(_entities[5].properties[2]);

  /// see [Prescription.date]
  static final date =
      QueryIntegerProperty<Prescription>(_entities[5].properties[3]);
}
