import 'package:doe_sangue/models/usuario.dart';

class Campanha {
  Usuario organizador;
  String? receptor;
  String tipoSanguineo;
  bool tipoPositivo;
  int qtdBolsasSolicitadas;
  int qtdBolsasDoadas;
  String local;
  DateTime dataInicio;
  bool ativa;
  Campanha(this.organizador, this.tipoSanguineo, this.tipoPositivo,
      this.qtdBolsasSolicitadas, this.local, this.dataInicio,
      {this.receptor, this.qtdBolsasDoadas = 0, this.ativa = true});
}
