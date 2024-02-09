import 'package:desafio_anlix_front_folly_fields/consumers/http_consumer_impl.dart';
import 'package:desafio_anlix_front_folly_fields/models/paciente_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:folly_fields/crud/abstract_consumer.dart';

class PacienteConsumer extends HttpConsumerImpl<PacienteModel, int> {
  ///
  ///
  ///
  PacienteConsumer() : super(<String>['pacientes']);

  ///
  ///
  ///
  @override
  fromJson(Map<String, dynamic> map) {
    return PacienteModel.fromJson(map);
  }


}
