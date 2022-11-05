class Usuario {
  int? idUsuario;
  String? nome;
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
    this.nome,
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
    nome = map['nome'];
    email = map['email'];
    telefone = map['telefone'];
    tipoSanguineo = map['tipoSanguineo'];
    totalDoacoes = map['totalDoacoes'];
    totalCampanhas = map['totalCompanhas'];
    dataUltimaDoacao = map['dataUltimaDoacao'];
  }

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'tipoSanguineo': tipoSanguineo,
      'totalDoacoes': totalDoacoes,
      'totalCompanhas': totalCampanhas,
      'dataUltimaDoacao': dataUltimaDoacao,
    };
  }
}
