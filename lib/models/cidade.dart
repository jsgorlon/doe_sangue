import 'package:doe_sangue/models/estado.dart';

class Cidade {
  int? idCidade;
  String? nomeCidade;
  int? ibge;
  Estado? estado;

  Cidade({this.idCidade, this.nomeCidade, this.ibge, this.estado});
  Cidade.fromMap(Map<dynamic, dynamic> map) {
    idCidade = map['idCidade'];
    nomeCidade = map['nomeCidade'];
    ibge = map['ibge'];
    estado = Estado.fromMap(map);
  }
}
