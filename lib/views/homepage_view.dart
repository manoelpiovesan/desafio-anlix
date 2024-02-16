import 'package:desafio_anlix_front_folly_fields/views/lists/paciente_list.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

///
///
///
class _HomepageState extends State<Homepage> {
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio Anlix'),
      ),
      body: PacienteList(
        selection: false,
        multipleSelection: false,

      ),
    );
  }
}
