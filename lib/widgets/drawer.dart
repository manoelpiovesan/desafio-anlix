import 'package:desafio_anlix_front_folly_fields/views/lists/paciente_list.dart';
import 'package:flutter/material.dart';

///
///
///
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Center(
              child: Text(
                'Desafio Anlix',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: 'MagistralBold',
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Pacientes'),
            subtitle: const Text('Lista de pacientes'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => PacienteList(
                    selection: false,
                    multipleSelection: false,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
