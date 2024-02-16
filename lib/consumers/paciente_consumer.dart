import 'package:desafio_anlix_front_folly_fields/consumers/http_consumer_impl.dart';
import 'package:desafio_anlix_front_folly_fields/models/paciente_model.dart';

class PacienteConsumer extends HttpConsumerImpl<PacienteModel, int> {
  ///
  ///
  ///
  PacienteConsumer() : super(<String>['pacientes']);

  ///
  ///
  ///
  @override
  PacienteModel fromJson(Map<String, dynamic> map) {
    return PacienteModel.fromJson(map);
  }


}
