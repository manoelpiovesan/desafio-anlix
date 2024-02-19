import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:desafio_anlix_front_folly_fields/consumers/indice_pulmonar_consumer.dart';
import 'package:desafio_anlix_front_folly_fields/models/indice_pulmonar_model.dart';
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
        builder: (BuildContext context,
            AsyncSnapshot<List<IndicePulmonar>> snapshot,) {
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

          return Card(
              child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                const SizedBox(height: 10),
                const Text('Indice Pulmonar',
                    style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10),
                Text(
                    'Máximo: ${indices.reduce((double a, double b) => a > b ? a : b)}',),
                Text('Mínimo: ${indices.reduce(
                  (double a, double b) => a < b ? a : b,
                )}'),
                Text(
                    'Média: ${indices.reduce((double a, double b) => a + b) / indices.length}',),
                Text('Última medição: ${indices.last}'),
              ],
            ),
          ),);
        },);
  }
}
