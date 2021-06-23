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
      id: const IdUid(2, 6691604221011885210),
      name: 'Appointment',
      lastPropertyId: const IdUid(8, 3111731640538589920),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 292907942194324822),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5191562190203519717),
            name: 'patientId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 44962279460149256),
            relationTarget: 'Patient'),
        ModelProperty(
            id: const IdUid(3, 8948749379628251926),
            name: 'start',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5045673809236275007),
            name: 'end',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8730320170763372391),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7888142565836185605),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 6023420282669789904),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 3111731640538589920),
            name: 'email',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 7637440109208649899),
      name: 'Medicine',
      lastPropertyId: const IdUid(3, 7885248437502776920),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1716489005987824826),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 166259051092228276),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7885248437502776920),
            name: 'provider',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 6991110882746293107),
      name: 'Patient',
      lastPropertyId: const IdUid(8, 5301855861173418515),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 9086989698835275940),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1746803873597970452),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 697740239254086272),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8809090685679999331),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6517951734660032801),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 5802263522225801350),
            name: 'dateFirstConsult',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4320220128300809681),
            name: 'dateMostRecentConsult',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 5301855861173418515),
            name: 'diagnosis',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 8382130931646875938),
      name: 'PatientFile',
      lastPropertyId: const IdUid(5, 6629062973510755626),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8308085898207919742),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(2, 155789837572033901),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(3, 4428493456762569294),
            name: 'path',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5328610899855170486),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6629062973510755626),
            name: 'patientId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 1833309954416717029),
            relationTarget: 'Patient')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(6, 5116948202094352500),
      name: 'Prescription',
      lastPropertyId: const IdUid(2, 2094098990380128904),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8074907889743567510),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2094098990380128904),
            name: 'patientId',
            type: 11,
            flags: 520,
            indexId: const IdUid(3, 3753409390561328516),
            relationTarget: 'Patient')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(7, 4172082692439354849),
      name: 'PrescriptionEntity',
      lastPropertyId: const IdUid(3, 3030284482373249019),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6674324771577555357),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5295819376461879061),
            name: 'medicineId',
            type: 11,
            flags: 520,
            indexId: const IdUid(4, 6183435405128252369),
            relationTarget: 'Medicine'),
        ModelProperty(
            id: const IdUid(3, 3030284482373249019),
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
      lastEntityId: const IdUid(7, 4172082692439354849),
      lastIndexId: const IdUid(4, 6183435405128252369),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [2105980254126945334],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        8929368112691541792,
        4596754707230663518,
        6719057657127873854,
        4021103401215910054,
        7408608506485051253,
        2849318786694514610,
        5990175068168941742
      ],
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
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          final nameOffset = fbb.writeString(object.name);
          final phoneOffset = fbb.writeString(object.phone);
          final emailOffset = fbb.writeString(object.email);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.patient.targetId);
          fbb.addInt64(2, object.start.millisecondsSinceEpoch);
          fbb.addInt64(3, object.end.millisecondsSinceEpoch);
          fbb.addOffset(4, descriptionOffset);
          fbb.addOffset(5, nameOffset);
          fbb.addOffset(6, phoneOffset);
          fbb.addOffset(7, emailOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Appointment(
              start: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0)),
              email:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 18, ''),
              phone:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 16, ''),
              end: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0)),
              description: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 12),
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 14, ''))
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
        toManyRelations: (Patient object) => {},
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
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, addressOffset);
          fbb.addOffset(3, emailOffset);
          fbb.addOffset(4, phoneOffset);
          fbb.addInt64(5, object.dateFirstConsult.millisecondsSinceEpoch);
          fbb.addInt64(6, object.dateMostRecentConsult.millisecondsSinceEpoch);
          fbb.addOffset(7, diagnosisOffset);
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
              dateFirstConsult: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0)),
              dateMostRecentConsult: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0)),
              email:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 10, ''),
              phone:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 12, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

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

  /// see [Appointment.start]
  static final start =
      QueryIntegerProperty<Appointment>(_entities[0].properties[2]);

  /// see [Appointment.end]
  static final end =
      QueryIntegerProperty<Appointment>(_entities[0].properties[3]);

  /// see [Appointment.description]
  static final description =
      QueryStringProperty<Appointment>(_entities[0].properties[4]);

  /// see [Appointment.name]
  static final name =
      QueryStringProperty<Appointment>(_entities[0].properties[5]);

  /// see [Appointment.phone]
  static final phone =
      QueryStringProperty<Appointment>(_entities[0].properties[6]);

  /// see [Appointment.email]
  static final email =
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
