import 'package:desafio_anlix_front_folly_fields/models/paciente_model.dart';
import 'package:desafio_anlix_front_folly_fields/widgets/indice_cardiaco_chart.dart';
import 'package:desafio_anlix_front_folly_fields/widgets/indice_pulmonar_chart.dart';
import 'package:desafio_anlix_front_folly_fields/widgets/paciente_card.dart';
import 'package:flutter/material.dart';

class PacienteDetailsView extends StatefulWidget {
  final PacienteModel paciente;

  const PacienteDetailsView({required this.paciente, super.key});

  @override
  State<PacienteDetailsView> createState() => _PacienteDetailsViewState();
}

///
///
///
class _PacienteDetailsViewState extends State<PacienteDetailsView> {
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paciente'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IndiceCardiacoChart(pacienteId: widget.paciente.id!),
                  IndicePulmonarChart(pacienteId: widget.paciente.id!),
                ],
              ),
              PacienteCard(paciente: widget.paciente),
            ],
          ),
        ),
      ),
    );
  }
}
