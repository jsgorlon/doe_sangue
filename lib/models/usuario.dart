class Usuario {
  String nome;
  String email;
  String telefone;
  String tipoSanguineo;
  bool tipoPositivo;
  int totalDoacoes;
  int totalCompanhas;
  DateTime? dataUltimaDoacao;
  Usuario(this.nome, this.email, this.telefone, this.tipoSanguineo,
      this.tipoPositivo,
      {this.totalDoacoes = 0, this.totalCompanhas = 0, this.dataUltimaDoacao});
}
