import 'package:doe_sangue/models/campanha.dart';
import 'package:doe_sangue/models/localColeta.dart';
import 'package:doe_sangue/models/usuario.dart';

class Doacao {
  int? idDoacao;
  //int? idLocal;
  Usuario? doador;
  Campanha? campanha;
  LocalColeta? local;
  DateTime? dataDoacao;

  Doacao({
    this.idDoacao,
    //this.idLocal,
    this.doador,
    this.campanha,
    this.local,
    this.dataDoacao,
  });
}
