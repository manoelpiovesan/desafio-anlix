import 'package:desafio_anlix_front_folly_fields/consumers/paciente_consumer.dart';
import 'package:desafio_anlix_front_folly_fields/models/paciente_model.dart';
import 'package:desafio_anlix_front_folly_fields/views/builders/paciente_builder.dart';
import 'package:flutter/material.dart';
import 'package:folly_fields/crud/abstract_edit.dart';
import 'package:folly_fields/crud/empty_edit_controller.dart';
import 'package:folly_fields/fields/cep_field.dart';
import 'package:folly_fields/fields/cpf_field.dart';
import 'package:folly_fields/fields/dropdown_field.dart';
import 'package:folly_fields/fields/email_field.dart';
import 'package:folly_fields/fields/integer_field.dart';
import 'package:folly_fields/fields/string_field.dart';
import 'package:folly_fields/responsive/responsive.dart';

///
///
///
class PacienteEdit extends AbstractEdit<PacienteModel, PacienteBuilder,
    PacienteConsumer, EmptyEditController<PacienteModel, int>, int> {
  ///
  ///
  ///
  const PacienteEdit(
    super.model,
    super.builder,
    super.consumer, {
    required super.edit,
    super.key,
  });

  ///
  ///
  ///
  @override
  List<Responsive> formContent(
    BuildContext context,
    PacienteModel model, {
    required bool edit,
    bool Function()? formValidate,
    void Function({required bool refresh})? refresh,
  }) {
    return <Responsive>[
      StringField(
        label: 'Nome',
        initialValue: model.nome,
        onSaved: (String? value) => model.nome = value ?? '',
        enabled: edit,
      ),
      IntegerField(
        label: 'Idade',
        initialValue: model.idade,
        onSaved: (int? value) => model.idade = value ?? 0,
        enabled: edit,
      ),
      CpfField(
        label: 'CPF',
        initialValue: model.cpf,
        onSaved: (String? value) => model.cpf = value ?? '',
        enabled: edit,
      ),
      StringField(
        label: 'RG',
        initialValue: model.rg,
        onSaved: (String? value) => model.rg = value ?? '',
        enabled: edit,
      ),
      StringField(
        label: 'Data de Nascimento',
        initialValue: model.dataNasc,
        onSaved: (String? value) => model.dataNasc = value ?? '',
        enabled: edit,
      ),
      StringField(
        label: 'Sexo',
        initialValue: model.sexo,
        onSaved: (String? value) => model.sexo = value ?? '',
        enabled: edit,
      ),
      StringField(
        label: 'Signo',
        initialValue: model.signo,
        onSaved: (String? value) => model.signo = value ?? '',
        enabled: edit,
      ),
      StringField(
        label: 'Mãe',
        initialValue: model.mae,
        onSaved: (String? value) => model.mae = value ?? '',
        enabled: edit,
      ),
      StringField(
        label: 'Pai',
        initialValue: model.pai,
        onSaved: (String? value) => model.pai = value ?? '',
        enabled: edit,
      ),
      EmailField(
        label: 'E-mail',
        initialValue: model.email,
        onSaved: (String? value) => model.email = value ?? '',
        enabled: edit,
      ),
      StringField(
        label: 'Senha',
        initialValue: model.senha,
        onSaved: (String? value) => model.senha = value ?? '',
        enabled: edit,
      ),
      CepField(
        label: 'CEP',
        initialValue: model.cep,
        onSaved: (String? value) => model.cep = value ?? '',
        enabled: edit,
      ),
      StringField(
        label: 'Endereço',
        initialValue: model.endereco,
        onSaved: (String? value) => model.endereco = value ?? '',
        enabled: edit,
      ),
      IntegerField(
        label: 'Número',
        initialValue: model.numero,
        onSaved: (int? value) => model.numero = value ?? 0,
        enabled: edit,
      ),
      StringField(
        label: 'Bairro',
        initialValue: model.bairro,
        onSaved: (String? value) => model.bairro = value ?? '',
        enabled: edit,
      ),
      StringField(
        label: 'Cidade',
        initialValue: model.cidade,
        onSaved: (String? value) => model.cidade = value ?? '',
        enabled: edit,
      ),
      StringField(
        label: 'Estado',
        initialValue: model.estado,
        onSaved: (String? value) => model.estado = value ?? '',
        enabled: edit,
      ),
      StringField(
        label: 'Telefone Fixo',
        initialValue: model.telefoneFixo,
        onSaved: (String? value) => model.telefoneFixo = value ?? '',
        enabled: edit,
      ),
      StringField(
        label: 'Celular',
        initialValue: model.celular,
        onSaved: (String? value) => model.celular = value ?? '',
        enabled: edit,
      ),
      StringField(
        label: 'Altura',
        initialValue: model.altura,
        onSaved: (String? value) => model.altura = value ?? '',
        enabled: edit,
      ),
      IntegerField(
        label: 'Peso',
        initialValue: model.peso,
        onSaved: (int? value) => model.peso = value ?? 0,
        enabled: edit,
      ),
      StringField(
        label: 'Tipo Sanguíneo',
        initialValue: model.tipoSanguineo,
        onSaved: (String? value) => model.tipoSanguineo = value ?? '',
        enabled: edit,
      ),
      DropdownField<String, Widget>(
        label: 'Cor',
        initialValue: model.cor,
        onSaved: (String? value) => model.cor = value ?? '',
        enabled: edit,
        items: const <String, Widget>{
          'preto': Text('Preto'),
          'amarelo': Text('Amarelo'),
          'azul': Text('Azul'),
          'verde': Text('Verde'),
          'vermelho': Text('Vermelho'),
          'roxo': Text('Roxo'),
          'laranja': Text('Laranja'),
        },
      )
    ];
  }
}
