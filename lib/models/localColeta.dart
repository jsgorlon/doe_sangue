class LocalColeta {
  int? idLocal;
  String? nomeLocal;
  String? logradoruo;
  String? bairro;
  String? cep;
  int? numero;
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
    this.logradoruo,
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
  }
}
