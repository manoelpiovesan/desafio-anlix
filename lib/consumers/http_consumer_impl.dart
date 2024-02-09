import 'package:agattp/agattp.dart';
import 'package:desafio_anlix_front_folly_fields/utils/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:folly_fields/crud/abstract_consumer.dart';
import 'package:folly_fields/crud/abstract_model.dart';

///
///
///
abstract class HttpConsumerImpl<T extends AbstractModel<ID>, ID>
    extends AbstractConsumer<T, ID> {
  ///
  ///
  ///
  const HttpConsumerImpl(
    super.routeName,
  );

  ///
  ///
  ///
  @override
  Future<ConsumerPermission> checkPermission(
    BuildContext context,
    List<String> paths,
  ) async =>
      const ConsumerPermission.allowAll();

  ///
  ///
  ///
  @override
  Future<T?> getById(
    BuildContext context,
    T model, {
    Map<String, String> extraParams = const <String, String>{},
  }) async {
    final Uri uri = Config().backUri.replace(
          path: <String>[...routeName, model.id.toString()].join('/'),
          queryParameters: extraParams.isNotEmpty ? extraParams : null,
        );

    try {
      final AgattpResponseJson<Map<String, dynamic>> response =
          await Agattp.authBearer('').getJson(uri);

      if ((response.statusCode < 200) || (response.statusCode > 299)) {
        throw Exception(
          'Backend returned status code ${response.statusCode}',
        );
      }

      return fromJson(response.json);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  ///
  ///
  ///
  @override
  Future<List<T>> list(
    BuildContext context, {
    int page = 0,
    int size = 20,
    Map<String, String> extraParams = const <String, String>{},
    bool forceOffline = false,
  }) async {
    final Uri uri = Config().backUri.replace(
      path: Uri.encodeFull(routeName.join('/')),
      queryParameters: <String, String>{
        ...extraParams,
        'page': '$page',
        'size': '$size',
      },
    );

    try {
      final AgattpResponseJson<List<dynamic>> response =
          await Agattp.authBearer('').getJson(uri);

      if ((response.statusCode < 200) || (response.statusCode > 299)) {
        throw Exception(
          'Backend returned status code ${response.statusCode}',
        );
      }

      // ignore: unnecessary_lambdas
      return response.json.map((dynamic json) => fromJson(json)).toList();
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return <T>[];
    }
  }

  ///
  ///
  ///
  @override
  Future<T?> saveOrUpdate(
    BuildContext context,
    T model, {
    Map<String, String> extraParams = const <String, String>{},
  }) async {
    final Uri uri = Config().backUri.replace(
          path: Uri.encodeFull(routeName.join('/')),
          queryParameters: extraParams.isNotEmpty ? extraParams : null,
        );

    try {
      final AgattpResponseJson<Map<String, dynamic>> response =
          await Agattp.authBearer('').postJson(
        uri,
        body: model.toMap(),
      );

      if ((response.statusCode < 200) || (response.statusCode > 299)) {
        throw Exception(
          'Backend returned status code ${response.statusCode}',
        );
      }

      return fromJson(response.json);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  ///
  ///
  ///
  @override
  Future<bool> delete(
    BuildContext context,
    T model, {
    Map<String, String> extraParams = const <String, String>{},
  }) async {
    final Uri uri = Config().backUri.replace(
          path: <String>[...routeName, model.id.toString()].join('/'),
          queryParameters: extraParams.isNotEmpty ? extraParams : null,
        );

    try {
      final AgattpResponse response = await Agattp.authBearer('').delete(uri);

      if ((response.statusCode < 200) || (response.statusCode > 299)) {
        throw Exception(
          'Backend returned status code ${response.statusCode}',
        );
      }

      return true;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
