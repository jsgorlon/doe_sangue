class Usuario {
  int? id;
  String? nome;
  String? email;
  String? telefone;
  String? tipoSanguineo;
  //bool? tipoPositivo;
  int? totalDoacoes;
  int? totalCampanhas;
  DateTime? dataUltimaDoacao;

  Usuario(this.nome, this.email, this.telefone, this.tipoSanguineo,
      //this.tipoPositivo,
      {this.totalDoacoes = 0,
      this.totalCampanhas = 0,
      this.dataUltimaDoacao});
}
