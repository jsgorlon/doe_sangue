import 'package:doe_sangue/models/usuario.dart';
import 'package:doe_sangue/services/database_handler.dart';
import 'package:doe_sangue/services/location.service.dart';
import 'package:geocoding/geocoding.dart';

class LocalColetaController {
  Future<List<Map>> read() async {
    var db = await DatabaseHandler.instance.database;
    List<Map> local = await db.rawQuery("SELECT * FROM locais_coleta;");
    return local;
  }

  Future<List<Map>> readEstados() async {
    var db = await DatabaseHandler.instance.database;
    List<Map> estados = await db.rawQuery("SELECT * FROM estados;");
    return estados;
  }

  Future<List<Map>> readCidade(int? estadoID) async {
    var db = await DatabaseHandler.instance.database;
    List<Map> cidades =
        await db.rawQuery("SELECT * FROM cidades WHERE idEstado == $estadoID;");
    return cidades;
  }

  Future<List<Map>> readLocalById(int idCidade) async {
    var db = await DatabaseHandler.instance.database;
    List<Map> local = await db.rawQuery(
        """SELECT l.idLocal, l.nomeLocal, l.logradouro, l.numero, l.complemento,
          l.bairro, l.cep, c.idCidade, c.nomeCidade, c.ibge, e.idEstado,
          e.nomeEstado, e.siglaUF
        FROM locais_coleta AS l
        INNER JOIN cidades as c ON l.idCidade == c.idcidade
        INNER JOIN estados as e on c.idestado == e.idestado
        WHERE l.idCidade == $idCidade;""");
    return local;
  }

  Future<List<Map>> readByUserLocation() async {
    var locator = LocationServices();
    Placemark place = await locator.getCurrentLocation();
    var db = await DatabaseHandler.instance.database;
    try {
      List<Map> locais = await db.rawQuery(
          """SELECT local.idLocal, local.nomeLocal, local.logradouro, local.bairro,
                  local.cep, local.numero, local.complemento,
                  cidades.idCidade, cidades.nomeCidade, cidades.ibge,
                  estados.idEstado, estados.nomeEstado, estados.siglaUF
                  FROM locais_coleta AS local
                  INNER JOIN cidades ON local.idCidade == cidades.idCidade
                  INNER JOIN estados ON cidades.idEstado == estados.idEstado
                  WHERE cidades.nomeCidade == '${place.subAdministrativeArea}' AND estados.nomeEstado == '${place.administrativeArea}';""");
      return locais;
    } catch (e) {
      print(e);
    }
    throw Exception();
  }

  void create(Usuario usuario) {}

  void update(Usuario usuario) {}

  void delete(Usuario usuario) {}
}
