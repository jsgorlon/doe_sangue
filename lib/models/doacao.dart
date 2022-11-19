import 'package:doe_sangue/models/campanha.dart';
import 'package:doe_sangue/models/localColeta.dart';
import 'package:doe_sangue/models/usuario.dart';

class Doacao {
  Usuario usuario;
  Campanha? campanha;
  LocalColeta? local;

  Doacao({
    required this.usuario,
    this.local,
    this.campanha,
  });

  toMap() {
    return {
      'idDoador': usuario.idUsuario,
      'idCampanha': campanha?.idCampanha,
      'idLocal': local?.idLocal ?? campanha?.local?.idLocal,
    };
  }
}
