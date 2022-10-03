import 'package:doe_sangue/models/campanha.dart';
import 'package:doe_sangue/models/usuario.dart';

class Doacao {
  Usuario doador;
  Campanha? campanha;
  String local;
  DateTime data;

  Doacao(this.doador, this.local, this.data, {this.campanha});
}
