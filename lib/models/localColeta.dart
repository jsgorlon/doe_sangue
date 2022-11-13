import 'package:doe_sangue/models/cidade.dart';

class LocalColeta {
  int? idLocal;
  String? nomeLocal;
  String? logradouro;
  String? bairro;
  String? cep;
  String? numero;
  String? complemento;
  Cidade? cidade;

  LocalColeta({
    this.idLocal,
    this.nomeLocal,
    this.logradouro,
    this.bairro,
    this.cep,
    this.numero,
    this.complemento,
    this.cidade,
  });

  LocalColeta.fromMap(Map<dynamic, dynamic> map) {
    idLocal = map['idLocal'];
    nomeLocal = map['nomeLocal'];
    logradouro = map['logradouro'];
    bairro = map['bairro'];
    cep = map['cep'];
    numero = map['numero'];
    complemento = map['complemento'];
    cidade = Cidade.fromMap(map);
  }
}
