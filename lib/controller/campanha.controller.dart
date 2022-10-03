import 'package:doe_sangue/models/campanha.dart';
import 'package:doe_sangue/models/usuario.dart';

class CampanhaController {
  final campanhas = [
    Campanha(Usuario('Julia', 'julia@gmail.com', '2345455456', 'A', false), 'A',
        false, 10, 'Campinas', DateTime(2022, 6, 6)),
  ];

  List<Campanha> read() {
    return campanhas;
  }

  void create(Campanha campanha) {
    campanhas.add(campanha);
  }

  void update(Campanha campanha) {}

  void delete(campanha) {}
}
