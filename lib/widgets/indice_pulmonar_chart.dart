import 'dart:io';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:desafio_anlix_front_folly_fields/consumers/indice_pulmonar_consumer.dart';
import 'package:desafio_anlix_front_folly_fields/consumers/paciente_consumer.dart';
import 'package:desafio_anlix_front_folly_fields/models/indice_pulmonar_model.dart';
import 'package:desafio_anlix_front_folly_fields/models/paciente_model.dart';
import 'package:flutter/material.dart';

class IndicePulmonarChart extends StatefulWidget {
  final int pacienteId;

  const IndicePulmonarChart({required this.pacienteId, super.key});

  @override
  State<IndicePulmonarChart> createState() => _IndicePulmonarChartState();
}

class _IndicePulmonarChartState extends State<IndicePulmonarChart> {
  late IndicePulmonarConsumer consumer;

  ///
  ///
  ///
  @override
  void initState() {
    consumer = IndicePulmonarConsumer(pacienteId: widget.pacienteId);
    super.initState();
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<IndicePulmonar>>(
      future: consumer.getAll(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<IndicePulmonar>> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        final List<double> indices = <double>[];
        for (int i = 0; i < snapshot.data!.length; i++) {
          indices.add(snapshot.data![i].indice);
        }
        final int timestamp = int.parse(snapshot.data!.last.data);
        final DateTime data = DateTime.fromMillisecondsSinceEpoch(
          timestamp * 1000,
        );

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: <Widget>[
                Sparkline(
                  useCubicSmoothing: true,
                  cubicSmoothingFactor: 0.2,
                  averageLine: true,
                  fillMode: FillMode.below,
                  fillColor: Colors.blue[50]!,
                  data: indices,
                  lineColor: Colors.blue,
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Índice Pulmonar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      indices[indices.length - 1] > indices[indices.length - 2]
                          ? const Icon(
                              Icons.arrow_upward,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.arrow_downward,
                              color: Colors.red,
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(),
                      1: FlexColumnWidth(),
                    },
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          const Text(
                            'Máximo',
                          ),
                          Text(
                            '${indices.reduce((double a, double b) => a > b ? a : b)}',
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          const Text(
                            'Mínimo:',
                          ),
                          Text(
                            '${indices.reduce((double a, double b) => a < b ? a : b)}',
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          const Text(
                            'Média:',
                          ),
                          Text(
                            (indices.reduce((double a, double b) => a + b) /
                                    indices.length)
                                .toStringAsFixed(6),
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          const Text(
                            'Última medição:',
                          ),
                          Text(
                            '${indices.last}',
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          const Text(
                            'Última atualização',
                          ),
                          Text(
                            '${data.day}/${data.month}/${data.year}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {
                    exportCSV(widget.pacienteId);
                  },
                  child: const Row(
                    children: <Widget>[
                      Icon(Icons.file_download),
                      SizedBox(width: 10),
                      Text('Exportar CSV'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> exportCSV(int id) async {
    final PacienteConsumer pacienteConsumer = PacienteConsumer();
    PacienteModel? paciente = PacienteModel()..id = id;

    paciente = await pacienteConsumer.getById(context, paciente);

    String nome = paciente!.nome.replaceAll(' ', '_').toLowerCase();

    final IndicePulmonarConsumer consumer =
        IndicePulmonarConsumer(pacienteId: id);
    final String csv = await consumer.getCSV();
    String pathName = nome.replaceAll(' ', '_').toLowerCase();

    final File file = File('csv/${pathName}_indice_pulmonar.csv');

    await file.writeAsString(csv).then((value) => print('CSV exportado'));
  }
}
