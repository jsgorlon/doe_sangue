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
  DateTime? ultimaDoacao;

  Usuario(
    this.nomeUsuario,
    this.sexo,
    this.dataNascimento,
    this.email,
    this.telefone,
    this.tipoSanguineo,
    this.senha,
    {this.ativo,
    this.dataCadastro,
    this.totalDoacoes = 0,
    this.totalCampanhas = 0,
    this.ultimaDoacao,}
  );

  Usuario.fromMap(Map<dynamic, dynamic> map) {
    idUsuario = map['idUsuario'];
    nomeUsuario = map['nomeUsuario'];
    sexo = map['sexo'];
    dataNascimento = map['dataNascimento'];
    email = map['email'];
    telefone = map['telefone'];
    tipoSanguineo = map['tipoSanguineo'];
    totalDoacoes = map['totalDoacoes'];
    ativo = map['ativo'] == 1 ? true : false;
    totalCampanhas = map['totalCampanhas'];
    ultimaDoacao = map['ultimaDoacao'];
  }

  Map<String, dynamic> toMap() {
    return {
      'nomeUsuario': nomeUsuario,
      'sexo' : sexo,
      'dataNascimento' : dataNascimento.toString(),
      'email': email,
      'telefone': telefone,
      'tipoSanguineo': tipoSanguineo,
      'senha' : senha,
    };
  }
}
