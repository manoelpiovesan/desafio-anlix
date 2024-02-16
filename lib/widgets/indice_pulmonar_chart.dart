import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:desafio_anlix_front_folly_fields/consumers/indice_pulmonar_consumer.dart';
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
                const Text('Indice Pulmonar'),
                const SizedBox(height: 10),
                Sparkline(
                  useCubicSmoothing: true,
                  cubicSmoothingFactor: 0.2,
                  averageLine: true,
                  fillMode: FillMode.below,
                  fillColor: Colors.blue[50]!,
                  data: indices,
                  lineColor: Colors.blue,
                ),
                            ],
                          ),
              ));
        });
  }
}
