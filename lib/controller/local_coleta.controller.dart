import 'package:doe_sangue/models/usuario.dart';
import 'package:doe_sangue/services/database_handler.dart';

class LocalColetaController {
  Future<List<Map>> read() async {
    var db = await DatabaseHandler.instance.database;
    List<Map> local = await db.rawQuery("SELECT * FROM locais_coleta;");
    return local;
  }

  Future<List<Map>> readById(int idLocal) async {
    var db = await DatabaseHandler.instance.database;
    List<Map> local = await db.rawQuery(
        """SELECT l.idLocal, l.nomeLocal, l.logradouro, l.numero, l.complemento,
          l.bairro, l.cep, c.idCidade, c.nomeCidade, c.ibge, e.idEstado,
          e.nomeEstado, e.siglaUF
        FROM locais_coleta AS l
        INNER JOIN cidades as c ON l.idCidade == c.idcidade
        INNER JOIN estados as e on c.idestado == e.idestado
        WHERE l.idLocal == $idLocal;""");
    return local;
  }

  void create(Usuario usuario) {}

  void update(Usuario usuario) {}

  void delete(Usuario usuario) {}
}