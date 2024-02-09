import 'package:desafio_anlix_front_folly_fields/utils/config.dart';
import 'package:desafio_anlix_front_folly_fields/views/homepage_view.dart';
import 'package:flutter/material.dart';
import 'package:folly_fields/folly_fields.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FollyFields.start(Config());

  runApp(const MyApp());
}

///
///
///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green,
        ),
        useMaterial3: false,
      ),
      home: const Homepage(),

    );
  }
}
