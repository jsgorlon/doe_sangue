import 'package:doe_sangue/models/campanha.dart';
import 'package:doe_sangue/models/localColeta.dart';
import 'package:doe_sangue/models/usuario.dart';

class CampanhaController {
  final campanhas = [
    Campanha(
      organizador: Usuario(
          nome: 'Julia',
          email: 'julia@gmail.com',
          telefone: '2345455456',
          tipoSanguineo: 'AB+'),
      tipoSanguineo: 'A+',
      qtdSolicitada: 10,
      local: LocalColeta(
        nomeLocal: 'Hospital ABC',
        nomeCidade: 'Campinas',
        siglaUF: 'SP',
      ),
      dataInicio: DateTime(2022, 6, 6),
      nomeReceptor: "Tales",
    ),
    Campanha(
      organizador: Usuario(
          nome: 'Joao',
          email: 'julia@gmail.com',
          telefone: '2345455456',
          tipoSanguineo: 'A-'),
      tipoSanguineo: 'AB+',
      qtdSolicitada: 10,
      local: LocalColeta(
        nomeLocal: 'Hospital ABC',
        nomeCidade: 'Campinas',
        siglaUF: 'SP',
      ),
      dataInicio: DateTime(2022, 6, 6),
    )
  ];

  List<Campanha> read() {
    return campanhas;
  }

  void create(Campanha campanha) {
    campanhas.add(campanha);
  }

  void update(Campanha campanha, int index) {
    campanhas[index] = campanha;
  }

  void delete(campanha) {}
}
