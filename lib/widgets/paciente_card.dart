import 'package:desafio_anlix_front_folly_fields/enums/color_enum.dart';
import 'package:desafio_anlix_front_folly_fields/models/paciente_model.dart';
import 'package:flutter/material.dart';

class PacienteCard extends StatelessWidget {
  final PacienteModel paciente;

  const PacienteCard({required this.paciente, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(paciente.nome),
                subtitle: Text(paciente.email),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(paciente.telefoneFixo),
              ),
              ListTile(
                leading: const Icon(Icons.phone_android),
                title: Text(paciente.celular),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: Text(
                  '${paciente.endereco}, ${paciente.numero}, ${paciente.bairro}, ${paciente.cidade} - ${paciente.estado}, ${paciente.cep}.',
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text(paciente.dataNasc),
              ),
              ListTile(
                leading: const Icon(Icons.circle),
                title: Text(paciente.sexo),
              ),
              ListTile(
                leading: const Icon(Icons.bloodtype),
                title: Text(paciente.tipoSanguineo),
              ),
              ListTile(
                leading: const Icon(Icons.accessibility),
                title: Text('${paciente.altura} m'),
              ),
              ListTile(
                leading: const Icon(Icons.balance),
                title: Text('${paciente.peso} kg'),
              ),
              ListTile(
                leading: Icon(
                  Icons.circle,
                  color: PacienteColor.fromString(paciente.cor).color,
                ),
                title: Text(paciente.cor.toUpperCase()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
