import 'package:folly_fields/crud/abstract_model.dart';

///
///
///
class PacienteModel extends AbstractModel<int> {
  String nome = '';
  int idade = 0;
  String cpf = '';
  String rg = '';
  String dataNasc = '';
  String sexo = '';
  String signo = '';
  String mae = '';
  String pai = '';
  String email = '';
  String senha = '';
  String cep = '';
  String endereco = '';
  int numero = 0;
  String bairro = '';
  String cidade = '';
  String estado = '';
  String telefoneFixo = '';
  String celular = '';
  String altura = '';
  int peso = 0;
  String tipoSanguineo = '';
  String cor = '';

  ///
  ///
  ///
  PacienteModel() : super();

  ///
  ///
  ///
  PacienteModel.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    nome = map['nome'];
    idade = map['idade'];
    cpf = map['cpf'];
    rg = map['rg'];
    dataNasc = map['data_nasc'];
    sexo = map['sexo'];
    signo = map['signo'];
    mae = map['mae'];
    pai = map['pai'];
    email = map['email'];
    senha = map['senha'];
    cep = map['cep'];
    endereco = map['endereco'];
    numero = map['numero'];
    bairro = map['bairro'];
    cidade = map['cidade'];
    estado = map['estado'];
    telefoneFixo = map['telefone_fixo'];
    celular = map['celular'];
    altura = map['altura'];
    peso = map['peso'];
    tipoSanguineo = map['tipo_sanguineo'];
    cor = map['cor'];
  }

  ///
  ///
  ///
  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = super.toMap();

    map['nome'] = nome;
    map['idade'] = idade;
    map['cpf'] = cpf;
    map['rg'] = rg;
    map['data_nasc'] = dataNasc;
    map['sexo'] = sexo;
    map['signo'] = signo;
    map['mae'] = mae;
    map['pai'] = pai;
    map['email'] = email;
    map['senha'] = senha;
    map['cep'] = cep;
    map['endereco'] = endereco;
    map['numero'] = numero;
    map['bairro'] = bairro;
    map['cidade'] = cidade;
    map['estado'] = estado;
    map['telefone_fixo'] = telefoneFixo;
    map['celular'] = celular;
    map['altura'] = altura;
    map['peso'] = peso;
    map['tipo_sanguineo'] = tipoSanguineo;
    map['cor'] = cor;

    return map;
  }

  ///
  ///
  ///
  @override
  String toString() => nome;
}
