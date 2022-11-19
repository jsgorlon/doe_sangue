import 'package:doe_sangue/models/campanha.dart';
import 'package:doe_sangue/services/database_handler.dart';
import 'package:sqflite/sqflite.dart';

class CampanhaController {
  Future<List<Map>> read() async {
    Database db = await DatabaseHandler.instance.database;
    List<Map> campanhas = await db
        .rawQuery("""SELECT camp.idCampanha, camp.idCriador, camp.nomeReceptor,
              camp.idLocal, camp.tipoSanguineo, camp.qtdSolicitada,
              COUNT(d.idCampanha) AS qtdDoada, camp.dataInicio, camp.ativa,
              usr.nomeusuario, loc.idLocal, loc.nomeLocal, loc.logradouro,
              loc.numero, loc.complemento, loc.bairro, loc.cep, c.idCidade,
              c.nomeCidade, c.ibge, e.idEstado, e.nomeEstado, e.siglaUF
              FROM campanhas AS camp
              INNER JOIN usuarios AS usr on camp.idCriador == usr.idusuario
              INNER JOIN locais_coleta AS loc ON camp.idLocal == loc.idLocal
              INNER JOIN cidades AS c ON loc.idCidade == c.idCidade
              INNER JOIN estados AS e on c.idEstado == e.idEstado
              LEFT JOIN doacoes AS d on camp.idCampanha == d.idCampanha
              GROUP BY camp.idCampanha;""");
    return campanhas;
  }

  void create(Campanha campanha) async {
    Database db = await DatabaseHandler.instance.database;
    db.insert('campanhas', campanha.toMap());
  }

  void updateState(int idCompanha) async {
    Database db = await DatabaseHandler.instance.database;
    QueryCursor countDoacoes =
        await db.rawQueryCursor("""SELECT c.qtdSolicitada, COUNT(d.idDoacao)
                                FROM campanhas as c
                                INNER JOIN doacao AS d ON c.idCampnha == d.idCampanha
                                WHERE  """, []);
  }

  void delete(campanha) async {}
}
