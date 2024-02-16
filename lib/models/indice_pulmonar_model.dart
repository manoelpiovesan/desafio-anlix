import 'package:folly_fields/crud/abstract_model.dart';

class IndicePulmonar extends AbstractModel<int> {
  String cpf = '';
  String data = '';
  double indice = 0;

  ///
  ///
  ///
  IndicePulmonar() : super();

  ///
  ///
  ///
  IndicePulmonar.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    cpf = map['cpf'];
    data = map['data'];
    indice = map['indice'];
  }

  ///
  ///
  ///
  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = super.toMap();

    map['cpf'] = cpf;
    map['data'] = data;
    map['indice'] = indice;

    return map;
  }
}
