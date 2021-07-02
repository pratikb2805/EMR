// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'db/models.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7080939914424202087),
      name: 'Appointment',
      lastPropertyId: const IdUid(8, 1832362290732044230),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8365419368721549848),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6908395018544879322),
            name: 'patientId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 447634300268820007),
            relationTarget: 'Patient'),
        ModelProperty(
            id: const IdUid(3, 7140507895605529729),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1584828040425353541),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 73532636589262348),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2857930950562944385),
            name: 'start',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 376084380643606309),
            name: 'end',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 1832362290732044230),
            name: 'description',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 6544786449629468841),
      name: 'Medicine',
      lastPropertyId: const IdUid(4, 5894603403254700340),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5377521790684689519),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3936270365483204865),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2062928433267818946),
            name: 'quantity',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5894603403254700340),
            name: 'prescriptionId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 8245584453398422594),
            relationTarget: 'Prescription')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 6950404802184647764),
      name: 'MedicineListEntity',
      lastPropertyId: const IdUid(4, 8502463093853384333),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3023123889783849676),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6580386558505026350),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4091155492228802611),
            name: 'provider',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8502463093853384333),
            name: 'type',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 4227955154838135697),
      name: 'Patient',
      lastPropertyId: const IdUid(10, 3539042573672191832),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 561011185090758097),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5828014450296259484),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5568317871889949566),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3337485430235835982),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1465901877172166491),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4804171812200774860),
            name: 'age',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 6321453696426905882),
            name: 'dateFirstConsult',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 530123121726765546),
            name: 'dateMostRecentConsult',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 3088210508781615234),
            name: 'diagnosis',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 3539042573672191832),
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
      id: const IdUid(5, 3973577379352354923),
      name: 'PatientFile',
      lastPropertyId: const IdUid(5, 6895850482325701392),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3257400913072176589),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(2, 2936302778204309865),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(3, 3219946642336316003),
            name: 'path',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8814670920095318707),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6895850482325701392),
            name: 'patienttoFileId',
            type: 11,
            flags: 520,
            indexId: const IdUid(3, 8060152220484273280),
            relationTarget: 'Patient')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(6, 8691863026352295535),
      name: 'Prescription',
      lastPropertyId: const IdUid(4, 7998327152450593840),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2528050233144351748),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5806366398101605156),
            name: 'patientId',
            type: 11,
            flags: 520,
            indexId: const IdUid(4, 5000893634525495997),
            relationTarget: 'Patient'),
        ModelProperty(
            id: const IdUid(3, 866038694180051694),
            name: 'filePath',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7998327152450593840),
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
      lastEntityId: const IdUid(6, 8691863026352295535),
      lastIndexId: const IdUid(4, 5000893634525495997),
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
