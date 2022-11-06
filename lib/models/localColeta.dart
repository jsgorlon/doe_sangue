class LocalColeta {
  int? idLocal;
  String? nomeLocal;
  String? logradouro;
  String? bairro;
  String? cep;
  String? numero;
  String? complemento;
  int? idCidade;
  String? nomeCidade;
  int? ibge;
  int? idEstado;
  String? nomeEstado;
  String? siglaUF;

  LocalColeta({
    this.idLocal,
    this.nomeLocal,
    this.logradouro,
    this.bairro,
    this.cep,
    this.numero,
    this.complemento,
    this.idCidade,
    this.nomeCidade,
    this.ibge,
    this.idEstado,
    this.nomeEstado,
    this.siglaUF,
  });

  LocalColeta.fromMap(Map<dynamic, dynamic> map) {
    idLocal = map['idLocal'];
    nomeLocal = map['nomeLocal'];
    logradouro = map['logradouro'];
    bairro = map['bairro'];
    cep = map['cep'];
    numero = map['numero'];
    complemento = map['complemento'];
    idCidade = map['idCidade'];
    nomeCidade = map['nomeCidade'];
    ibge = map['ibge'];
    idEstado = map['idEstado'];
    nomeEstado = map['nomeEstado'];
    siglaUF = map['siglaUF'];
  }
}
