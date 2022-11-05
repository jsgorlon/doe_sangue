import 'package:doe_sangue/models/localColeta.dart';
import 'package:doe_sangue/models/usuario.dart';

class Campanha {
  int? idCampanha;
  //int? idUsuario;
  //int? idLocal;
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
    //this.idUsuario,
    //this.idLocal,
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
    //idUsuario = map['idUsuario'];
    //idLocal = map['idLocal'];
    organizador = Usuario.fromMap(map['organizador']);
    nomeReceptor = map['nomeReceptor'];
    tipoSanguineo = map['tipoSanguineo'];
    qtdSolicitada = map['qtdSolicitada'];
    qtdDoada = map['qtdDoada'];
    local = LocalColeta.fromMap(map['local']);
    dataInicio = map['dataInicio'];
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
