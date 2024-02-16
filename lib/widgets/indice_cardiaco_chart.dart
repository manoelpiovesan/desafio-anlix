import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:desafio_anlix_front_folly_fields/consumers/indice_cardiaco_consumer.dart';
import 'package:flutter/material.dart';

class IndiceCardiacoChart extends StatefulWidget {
  final int pacienteId;

  const IndiceCardiacoChart({required this.pacienteId, super.key});

  @override
  State<IndiceCardiacoChart> createState() => _IndiceCardiacoChartState();
}

class _IndiceCardiacoChartState extends State<IndiceCardiacoChart> {
  late IndiceCardiacoConsumer consumer;

  ///
  ///
  ///
  @override
  void initState() {
    consumer = IndiceCardiacoConsumer(pacienteId: widget.pacienteId);
    super.initState();
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: consumer.getAll(),
        builder: (context, snapshot) {
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
          List<double> indices = [];
          for (var i = 0; i < snapshot.data!.length; i++) {
            indices.add(snapshot.data![i].indice);
          }

          return Card(
              child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Sparkline(
                  useCubicSmoothing: true,
                  averageLine: true,
                  fillMode: FillMode.below,
                  fillColor: Colors.red[50]!,
                  cubicSmoothingFactor: 0.2,
                  data: indices,
                  lineColor: Colors.red,
                ),
                const SizedBox(height: 10),
                const Text('Indice Cardíaco',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Máximo: ${indices.reduce((a, b) => a > b ? a : b)}'),
                Text('Mínimo: ${indices.reduce((a, b) => a < b ? a : b)}'),
                Text(
                    'Média: ${indices.reduce((a, b) => a + b) / indices.length}'),
                Text('Última medição: ${indices.last}'),
              ],
            ),
          ));
        });
  }
}
