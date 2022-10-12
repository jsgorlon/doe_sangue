import 'package:doe_sangue/models/usuario.dart';

class Campanha {
  int? id;
  Usuario? organizador;
  String? receptor;
  String? tipoSanguineo;
  //bool? tipoPositivo;
  int? qtdBolsasSolicitadas;
  int? qtdBolsasDoadas;
  String? local;
  String? cidade;
  String? estado;
  DateTime? dataInicio;
  bool? ativa;

  Campanha(this.organizador, this.tipoSanguineo, this.qtdBolsasSolicitadas,
      this.local, this.cidade, this.estado, this.dataInicio,
      {this.receptor, this.qtdBolsasDoadas = 0, this.ativa = true});
}
