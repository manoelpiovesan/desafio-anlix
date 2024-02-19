import 'package:agattp/agattp.dart';
import 'package:desafio_anlix_front_folly_fields/models/indice_pulmonar_model.dart';
import 'package:flutter/foundation.dart';

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
    final Uri uri = Uri.parse('http://localhost:8080/pacientes/$pacienteId/pulmonar')
        .replace(queryParameters: <String, String>{'all': 'true'});

    try {
      final AgattpResponseJson<List<dynamic>> response =
          await Agattp.authBearer('').getJson(uri);

      if ((response.statusCode < 200) || (response.statusCode > 299)) {
        throw Exception(
          'Backend returned status code ${response.statusCode}',
        );
      }

      return response.json.map((dynamic e) => IndicePulmonar.fromJson(e)).toList();
    } on Exception catch (e) {
      if(kDebugMode){
        print(e);
      }
      return <IndicePulmonar>[];
    }
  }

  ///
  ///
  ///
  Future<String> getCSV() async {
    final Uri uri = Uri.parse('http://localhost:8080/pacientes/csv/pulmonar/$pacienteId');


    try {
      final AgattpResponse response =
      await Agattp.authBearer('').get(uri);

      if ((response.statusCode < 200) || (response.statusCode > 299)) {
        throw Exception(
          'Backend returned status code ${response.statusCode}',
        );
      }

      return response.body;
    } on Exception catch (e) {
      if(kDebugMode){
        print(e);
      }
      return '';
    }
  }
}
