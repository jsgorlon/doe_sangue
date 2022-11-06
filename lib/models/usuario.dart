class Usuario {
  int? idUsuario;
  String? nomeUsuario;
  String? email;
  String? telefone;
  String? tipoSanguineo;
  String? senha;
  bool? ativo;
  DateTime? dataCadastro;
  int? totalDoacoes;
  int? totalCampanhas;
  DateTime? dataUltimaDoacao;

  Usuario({
    this.idUsuario,
    this.nomeUsuario,
    this.email,
    this.telefone,
    this.tipoSanguineo,
    this.senha,
    this.ativo,
    this.dataCadastro,
    this.totalDoacoes = 0,
    this.totalCampanhas = 0,
    this.dataUltimaDoacao,
  });

  Usuario.fromMap(Map<dynamic, dynamic> map) {
    idUsuario = map['idUsuario'];
    nomeUsuario = map['nomeUsuario'];
    email = map['email'];
    telefone = map['telefone'];
    tipoSanguineo = map['tipoSanguineo'];
    totalDoacoes = map['totalDoacoes'];
    ativo = map['ativo'] == 1 ? true : false;
    totalCampanhas = map['totalCompanhas'];
    dataUltimaDoacao = map['dataUltimaDoacao'];
  }

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'nomeUsuario': nomeUsuario,
      'email': email,
      'telefone': telefone,
      'tipoSanguineo': tipoSanguineo,
      'totalDoacoes': totalDoacoes,
      'totalCompanhas': totalCampanhas,
      'dataUltimaDoacao': dataUltimaDoacao,
    };
  }
}
