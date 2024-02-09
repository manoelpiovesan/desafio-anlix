import 'package:desafio_anlix_front_folly_fields/consumers/paciente_consumer.dart';
import 'package:desafio_anlix_front_folly_fields/models/paciente_model.dart';
import 'package:desafio_anlix_front_folly_fields/views/builders/paciente_builder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:folly_fields/crud/abstract_edit.dart';
import 'package:folly_fields/crud/empty_edit_controller.dart';
import 'package:folly_fields/responsive/responsive.dart';

class PacienteEdit extends AbstractEdit<PacienteModel, PacienteBuilder,
    PacienteConsumer, EmptyEditController<PacienteModel, int>, int> {
  const PacienteEdit(super.model, super.builder, super.consumer,
      {super.key, required super.edit});

  @override
  List<Responsive> formContent(BuildContext context, PacienteModel model,
      {required bool edit,
      bool Function()? formValidate,
      void Function({required bool refresh})? refresh}) {
    // TODO: implement formContent
    return [];
  }
}
