import 'package:agattp/agattp.dart';
import 'package:desafio_anlix_front_folly_fields/models/indice_cardiaco_model.dart';
import 'package:flutter/foundation.dart';

class IndiceCardiacoConsumer {
  int pacienteId;

  ///
  ///
  ///
  IndiceCardiacoConsumer({required this.pacienteId});

  ///
  ///
  ///
  Future<List<IndiceCardiaco>> getAll() async {
    final Uri uri =
        Uri.parse('http://localhost:8080/pacientes/$pacienteId/cardiaco')
            .replace(queryParameters: <String, String>{'all': 'true'});

    try {
      final AgattpResponseJson<List<dynamic>> response =
          await Agattp.authBearer('').getJson(uri);

      if ((response.statusCode < 200) || (response.statusCode > 299)) {
        throw Exception(
          'Backend returned status code ${response.statusCode}',
        );
      }

      return response.json.map((dynamic e) => IndiceCardiaco.fromJson(e)).toList();
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return <IndiceCardiaco>[];
    }
  }
}
