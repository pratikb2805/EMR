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
      id: const IdUid(1, 4371602397177704092),
      name: 'Appointment',
      lastPropertyId: const IdUid(8, 8039119639400302088),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6061270825200836453),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1219717231629178966),
            name: 'patientId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 5158486731302432950),
            relationTarget: 'Patient'),
        ModelProperty(
            id: const IdUid(3, 3786462397113928356),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6157707248184637489),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4088883536293290833),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 1176620972550200681),
            name: 'start',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 3679993359459088339),
            name: 'end',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 8039119639400302088),
            name: 'description',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 8155561616032987824),
      name: 'Medicine',
      lastPropertyId: const IdUid(3, 7071313935615602726),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3042531738525853467),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8550723889378993022),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7071313935615602726),
            name: 'provider',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 2027780607877140045),
      name: 'Patient',
      lastPropertyId: const IdUid(9, 3542123101584986053),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3966376151838177080),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7222124165579954708),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3549853688119741715),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 955409084760728994),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7475904709194014972),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 6790583786861772546),
            name: 'dateFirstConsult',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 1977451129722142823),
            name: 'dateMostRecentConsult',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 7986054003716045656),
            name: 'diagnosis',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 3542123101584986053),
            name: 'age',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 7659098127538250496),
            name: 'appointments',
            targetId: const IdUid(1, 4371602397177704092))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 8801701381532737960),
      name: 'PatientFile',
      lastPropertyId: const IdUid(5, 6731581801918331955),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5226737391859873594),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(2, 6284800537974557604),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(3, 6991694864451890578),
            name: 'path',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5223912250620349625),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6731581801918331955),
            name: 'patientId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 2879700393943187454),
            relationTarget: 'Patient')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 8390412235775250471),
      name: 'Prescription',
      lastPropertyId: const IdUid(2, 2368344731964821795),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6820226788376003936),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2368344731964821795),
            name: 'patientId',
            type: 11,
            flags: 520,
            indexId: const IdUid(3, 1760529937070731233),
            relationTarget: 'Patient')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(6, 6041722346552210838),
      name: 'PrescriptionEntity',
      lastPropertyId: const IdUid(3, 2911667685045502053),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 9001890466887169680),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2339420723400245966),
            name: 'medicineId',
            type: 11,
            flags: 520,
            indexId: const IdUid(4, 6672298665733805326),
            relationTarget: 'Medicine'),
        ModelProperty(
            id: const IdUid(3, 2911667685045502053),
            name: 'quantity',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(6, 6041722346552210838),
      lastIndexId: const IdUid(4, 6672298665733805326),
      lastRelationId: const IdUid(1, 7659098127538250496),
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
        toOneRelations: (Medicine object) => [],
        toManyRelations: (Medicine object) => {},
        getId: (Medicine object) => object.id,
        setId: (Medicine object, int id) {
          object.id = id;
        },
        objectToFB: (Medicine object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final providerOffset = fbb.writeString(object.provider);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, providerOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Medicine(
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              provider:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    Patient: EntityDefinition<Patient>(
        model: _entities[2],
        toOneRelations: (Patient object) => [],
        toManyRelations: (Patient object) =>
            {RelInfo<Patient>.toMany(1, object.id): object.appointments},
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
          fbb.startTable(10);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, addressOffset);
          fbb.addOffset(3, emailOffset);
          fbb.addOffset(4, phoneOffset);
          fbb.addInt64(5, object.dateFirstConsult.millisecondsSinceEpoch);
          fbb.addInt64(6, object.dateMostRecentConsult.millisecondsSinceEpoch);
          fbb.addOffset(7, diagnosisOffset);
          fbb.addInt64(8, object.age);
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
                  const fb.StringReader().vTableGet(buffer, rootOffset, 18, ''),
              age: const fb.Int64Reader().vTableGet(buffer, rootOffset, 20, 0),
              dateFirstConsult: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0)),
              dateMostRecentConsult: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0)),
              email:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 10, ''),
              phone:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 12, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          InternalToManyAccess.setRelInfo(object.appointments, store,
              RelInfo<Patient>.toMany(1, object.id), store.box<Patient>());
          return object;
        }),
    PatientFile: EntityDefinition<PatientFile>(
        model: _entities[3],
        toOneRelations: (PatientFile object) => [object.patient],
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
          fbb.addInt64(4, object.patient.targetId);
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
          object.patient.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          object.patient.attach(store);
          return object;
        }),
    Prescription: EntityDefinition<Prescription>(
        model: _entities[4],
        toOneRelations: (Prescription object) => [object.patient],
        toManyRelations: (Prescription object) => {},
        getId: (Prescription object) => object.id,
        setId: (Prescription object, int id) {
          object.id = id;
        },
        objectToFB: (Prescription object, fb.Builder fbb) {
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.patient.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Prescription()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.patient.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          object.patient.attach(store);
          return object;
        }),
    PrescriptionEntity: EntityDefinition<PrescriptionEntity>(
        model: _entities[5],
        toOneRelations: (PrescriptionEntity object) => [object.medicine],
        toManyRelations: (PrescriptionEntity object) => {},
        getId: (PrescriptionEntity object) => object.id,
        setId: (PrescriptionEntity object, int id) {
          object.id = id;
        },
        objectToFB: (PrescriptionEntity object, fb.Builder fbb) {
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.medicine.targetId);
          fbb.addInt64(2, object.quantity);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = PrescriptionEntity(
              quantity:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.medicine.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          object.medicine.attach(store);
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

  /// see [Medicine.provider]
  static final provider =
      QueryStringProperty<Medicine>(_entities[1].properties[2]);
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

  /// see [Patient.dateFirstConsult]
  static final dateFirstConsult =
      QueryIntegerProperty<Patient>(_entities[2].properties[5]);

  /// see [Patient.dateMostRecentConsult]
  static final dateMostRecentConsult =
      QueryIntegerProperty<Patient>(_entities[2].properties[6]);

  /// see [Patient.diagnosis]
  static final diagnosis =
      QueryStringProperty<Patient>(_entities[2].properties[7]);

  /// see [Patient.age]
  static final age = QueryIntegerProperty<Patient>(_entities[2].properties[8]);

  /// see [Patient.appointments]
  static final appointments =
      QueryRelationMany<Patient, Appointment>(_entities[2].relations[0]);
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

  /// see [PatientFile.patient]
  static final patient =
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
}

/// [PrescriptionEntity] entity fields to define ObjectBox queries.
class PrescriptionEntity_ {
  /// see [PrescriptionEntity.id]
  static final id =
      QueryIntegerProperty<PrescriptionEntity>(_entities[5].properties[0]);

  /// see [PrescriptionEntity.medicine]
  static final medicine = QueryRelationProperty<PrescriptionEntity, Medicine>(
      _entities[5].properties[1]);

  /// see [PrescriptionEntity.quantity]
  static final quantity =
      QueryIntegerProperty<PrescriptionEntity>(_entities[5].properties[2]);
}
