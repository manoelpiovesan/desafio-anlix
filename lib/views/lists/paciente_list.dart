import 'package:desafio_anlix_front_folly_fields/consumers/paciente_consumer.dart';
import 'package:desafio_anlix_front_folly_fields/models/paciente_model.dart';
import 'package:desafio_anlix_front_folly_fields/views/builders/paciente_builder.dart';
import 'package:folly_fields/crud/abstract_list.dart';

class PacienteList extends AbstractList<PacienteModel, PacienteBuilder,
    PacienteConsumer, int> {
  PacienteList({
    super.key,
    required super.selection,
    required super.multipleSelection,
  }) : super(
          builder: PacienteBuilder(),
          consumer: PacienteConsumer(),

        );
}
