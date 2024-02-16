import 'package:desafio_anlix_front_folly_fields/consumers/paciente_consumer.dart';
import 'package:desafio_anlix_front_folly_fields/models/paciente_model.dart';
import 'package:desafio_anlix_front_folly_fields/views/builders/paciente_builder.dart';
import 'package:desafio_anlix_front_folly_fields/views/edits/paciente_edit.dart';
import 'package:desafio_anlix_front_folly_fields/views/paciente_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:folly_fields/crud/abstract_list.dart';

///
///
///
class PacienteList extends AbstractList<PacienteModel,
    PacienteBuilder,
    PacienteConsumer,
    int> {
  ///
  ///
  ///
  PacienteList({
    required super.selection,required super.multipleSelection, super.key
  }) : super(
    builder: PacienteBuilder(),
    consumer: PacienteConsumer(),
    onUpdate: (BuildContext context, PacienteModel model,
        PacienteBuilder builder, PacienteConsumer consumer,
        {required bool edit,}) async {
      return PacienteDetailsView(paciente: model);
    },
  );
}
