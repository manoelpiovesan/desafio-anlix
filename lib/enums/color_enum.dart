import 'package:flutter/material.dart';

///
///
///
enum PacienteColor {
  azul(Colors.blue),
  verde(Colors.green),
  amarelo(Colors.yellow),
  vermelho(Colors.red),
  preto(Colors.black),
  roxo(Colors.purple),
  laranja(Colors.orange);

  final Color color;

  ///
  ///
  ///
  const PacienteColor(this.color);
}
