import 'package:doe_sangue/models/doacao.dart';
import 'package:doe_sangue/models/usuario.dart';

class DoacaoController {
  final doacoes = [
    Doacao(Usuario('Carla', 'carla@hotmail.com', '12634576', 'O'),
        'São José do Rio Preto', DateTime(2022, 10, 31)),
  ];

  List<Doacao> read() {
    return doacoes;
  }

  void create(Doacao doacao) {
    doacoes.add(doacao);
  }

  void update(Doacao doacao) {}

  void delete(Doacao doacao) {}
}
