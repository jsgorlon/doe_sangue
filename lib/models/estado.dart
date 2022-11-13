class Estado {
  int? idEstado;
  String? nomeEstado;
  String? siglaUF;

  Estado({
    this.idEstado,
    this.nomeEstado,
    this.siglaUF,
  });

  Estado.fromMap(Map<dynamic, dynamic> map) {
    idEstado = map['idEstado'];
    nomeEstado = map['nomeEstado'];
    siglaUF = map['siglaUF'];
  }

  Map<String, dynamic> toMap() {
    return {'idEstado': idEstado, 'nomeEstado': nomeEstado, 'siglaUF': siglaUF};
  }
}
