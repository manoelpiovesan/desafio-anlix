import 'package:folly_fields/folly_fields.dart';

///
///
///
class Config extends AbstractConfig {
  ///
  ///
  ///
  static final Config _singleton = Config._internal();

  ///
  ///
  ///
  factory Config() => _singleton;

  ///
  ///
  ///
  Config._internal();

  ///
  ///
  /// database related
  Uri backUri = Uri.parse('http://localhost:8080/');
}
