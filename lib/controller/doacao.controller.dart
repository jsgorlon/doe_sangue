import 'package:doe_sangue/models/doacao.dart';
import 'package:doe_sangue/models/localColeta.dart';
import 'package:doe_sangue/models/usuario.dart';

class DoacaoController {
  final doacoes = [
    Doacao(
      doador: Usuario(
          nome: 'Carla',
          email: 'carla@hotmail.com',
          telefone: '12634576',
          tipoSanguineo: 'O'),
      local: LocalColeta(
        nomeLocal: 'HB',
        nomeCidade: 'São José do Rio Preto',
        siglaUF: 'SP',
      ),
      dataDoacao: DateTime(2022, 10, 31),
    ),
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
