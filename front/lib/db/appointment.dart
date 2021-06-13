import 'package:objectbox/objectbox.dart';
import 'patient.dart';

@Entity()
class appointment {
  final patient = ToOne<_patient>();
}
