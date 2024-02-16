import 'package:agattp/agattp.dart';
import 'package:desafio_anlix_front_folly_fields/models/indice_pulmonar_model.dart';

class IndicePulmonarConsumer {
  int pacienteId;

  ///
  ///
  ///
  IndicePulmonarConsumer({required this.pacienteId});

  ///
  ///
  ///
  Future<List<IndicePulmonar>> getAll() async {
    Uri uri = Uri.parse('http://localhost:8080/pacientes/$pacienteId/pulmonar')
        .replace(queryParameters: <String, String>{'all': 'true'});

    try {
      final AgattpResponseJson<List<dynamic>> response =
          await Agattp.authBearer('').getJson(uri);

      if ((response.statusCode < 200) || (response.statusCode > 299)) {
        throw Exception(
          'Backend returned status code ${response.statusCode}',
        );
      }

      return response.json.map((e) => IndicePulmonar.fromJson(e)).toList();
    } on Exception catch (e) {
      print(e);
      return <IndicePulmonar>[];
    }
  }
}
