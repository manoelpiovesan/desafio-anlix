import 'package:desafio_anlix_front_folly_fields/enums/color_enum.dart';
import 'package:desafio_anlix_front_folly_fields/models/paciente_model.dart';
import 'package:flutter/material.dart';
import 'package:folly_fields/crud/abstract_builder.dart';

class PacienteBuilder extends AbstractBuilder<PacienteModel, int> {
  ///
  ///
  ///
  @override
  Widget getTitle(BuildContext context, PacienteModel model) {
    return Text(model.nome);
  }

  ///
  ///
  ///
  @override
  String plural(BuildContext context) {
    return 'Pacientes';
  }

  ///
  ///
  ///
  @override
  String single(BuildContext context) {
    return 'Paciente';
  }

  ///
  ///
  ///
  @override
  Widget getSubtitle(BuildContext context, PacienteModel model) {
    return Text(model.dataNasc);
  }

  ///
  ///
  ///
  @override
  Widget getLeading(BuildContext context, PacienteModel model) {
    return Icon(
      Icons.circle,
      color: PacienteColor.fromString(model.cor).color,
    );
  }
}
