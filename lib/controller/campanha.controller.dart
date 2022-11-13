import 'package:doe_sangue/models/campanha.dart';
import 'package:doe_sangue/services/database_handler.dart';

class CampanhaController {
  Future<List<Map>> read() async {
    var db = await DatabaseHandler.instance.database;
    List<Map> campanhas = await db
        .rawQuery("""SELECT camp.idCampanha, camp.idCriador, camp.nomeReceptor,
              camp.idLocal, camp.tipoSanguineo, camp.qtdSolicitada,
              COUNT(d.idCampanha) AS qtdDoada, camp.dataInicio, camp.ativa,
              usr.nomeusuario, loc.idLocal, loc.nomeLocal, loc.logradouro,
              loc.numero, loc.complemento, loc.bairro, loc.cep, c.idCidade,
              c.nomeCidade, c.ibge, e.idEstado, e.nomeEstado, e.siglaUF
              FROM campanhas as camp
              INNER JOIN usuarios as usr on camp.idCriador == usr.idusuario
              INNER JOIN locais_coleta as loc ON camp.idLocal == loc.idLocal
              INNER JOIN cidades as c ON loc.idCidade == c.idCidade
              INNER JOIN estados as e on c.idEstado == e.idEstado
              LEFT JOIN doacoes AS d on camp.idCampanha == d.idCampanha
              GROUP BY camp.idCampanha;""");
    return campanhas;
  }

  void create(Campanha campanha) async {}

  void update(Campanha campanha, int index) async {}

  void delete(campanha) async {}
}
