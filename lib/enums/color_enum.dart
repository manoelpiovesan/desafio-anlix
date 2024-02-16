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

  ///
  ///
  ///
  static PacienteColor fromString(String value) {
    switch (value.trim().toLowerCase()) {
      case 'azul':
        return PacienteColor.azul;
      case 'verde':
        return PacienteColor.verde;
      case 'amarelo':
        return PacienteColor.amarelo;
      case 'vermelho':
        return PacienteColor.vermelho;
      case 'preto':
        return PacienteColor.preto;
      case 'roxo':
        return PacienteColor.roxo;
      case 'laranja':
        return PacienteColor.laranja;
      default:
        return PacienteColor.verde;
    }
  }
}
