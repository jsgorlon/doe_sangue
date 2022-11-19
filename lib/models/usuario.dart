import 'package:doe_sangue/models/doacao.dart';

class Usuario {
  int? idUsuario;
  String? nomeUsuario;
  String? sexo;
  DateTime? dataNascimento;
  String? email;
  String? telefone;
  String? tipoSanguineo;
  String? senha;
  bool? ativo;
  DateTime? dataCadastro;
  int? totalDoacoes;
  int? totalCampanhas;
  int? campParticipadas;
  DateTime? ultimaDoacao;

  Usuario({
    this.nomeUsuario,
    this.sexo,
    this.dataNascimento,
    this.email,
    this.telefone,
    this.tipoSanguineo,
    this.senha,
    this.ativo,
    this.dataCadastro,
    this.totalDoacoes = 0,
    this.totalCampanhas = 0,
    this.campParticipadas = 0,
    this.ultimaDoacao,
  });

  Usuario.fromMap(Map<dynamic, dynamic> map) {
    idUsuario = map['idUsuario'];
    nomeUsuario = map['nomeUsuario'];
    sexo = map['sexo'];
    if (map['dataNascimento'] != null) {
      dataNascimento = DateTime.tryParse(map['dataNascimento']);
    }
    if (map['dataCadastro'] != null) {
      dataCadastro = DateTime.tryParse(map['dataCadastro']);
    }
    email = map['email'];
    telefone = map['telefone'];
    tipoSanguineo = map['tipoSanguineo'];
    totalDoacoes = map['totalDoacoes'];
    ativo = map['ativo'] == 1 ? true : false;
    totalCampanhas = map['totalCampanhas'];
    campParticipadas = map['campParticipadas'];
    if (map['ultimaDoacao'] != null) {
      ultimaDoacao = DateTime.tryParse(map['ultimaDoacao']);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'nomeUsuario': nomeUsuario,
      'sexo': sexo,
      'dataNascimento': dataNascimento.toString(),
      'email': email,
      'telefone': telefone,
      'tipoSanguineo': tipoSanguineo,
      'senha': senha,
    };
  }

  int daysToNestDonation() {
    int recuperacao = (sexo == 'Masculino') ? 60 : 90;
    if (ultimaDoacao != null) {
      int nextDate = (ultimaDoacao!
              .add(Duration(days: recuperacao))
              .difference(DateTime.now()))
          .inDays;
      return nextDate;
    } else {
      return 0;
    }
  }

  bool canDonateByAge() {
    bool elegible =
        (DateTime.now().difference(dataNascimento!).inDays > 25202.3 ||
                DateTime.now().difference(dataNascimento!).inDays < 5844)
            ? false
            : true;
    return elegible;
  }
}
