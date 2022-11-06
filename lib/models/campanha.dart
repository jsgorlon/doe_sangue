import 'package:doe_sangue/models/localColeta.dart';
import 'package:doe_sangue/models/usuario.dart';

class Campanha {
  int? idCampanha;
  Usuario? organizador;
  String? nomeReceptor;
  String? tipoSanguineo;
  int? qtdSolicitada;
  int? qtdDoada;
  LocalColeta? local;
  DateTime? dataInicio;
  bool? ativa;

  Campanha({
    this.idCampanha,
    this.organizador,
    this.nomeReceptor,
    this.tipoSanguineo,
    this.qtdSolicitada,
    this.qtdDoada,
    this.local,
    this.dataInicio,
    this.ativa,
  });

  Campanha.fromMap(Map<dynamic, dynamic> map) {
    idCampanha = map['idCampanha'];
    organizador = Usuario.fromMap(map);
    nomeReceptor = map['nomeReceptor'] ?? "";
    tipoSanguineo = map['tipoSanguineo'];
    qtdSolicitada = map['qtdSolicitada'];
    qtdDoada = map['qtdDoada'] ?? 0;
    local = LocalColeta.fromMap(map);
    dataInicio = DateTime.tryParse(map['dataInicio']);
    ativa = map['ativa'] == 1 ? true : false;
  }

  Map<String, dynamic> toMap() {
    return {
      'idCampanha': idCampanha,
      'organizador': organizador,
      'nomeReceptor': nomeReceptor,
      'tipoSanguineo': tipoSanguineo,
      'qtdSolicitada': qtdSolicitada,
      'qtdDoada': qtdDoada,
      'local': local,
      'dataInicio': dataInicio,
      'ativa': ativa! ? true : false,
    };
  }
}
