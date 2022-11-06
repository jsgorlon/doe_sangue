import 'package:doe_sangue/models/usuario.dart';
import 'package:doe_sangue/services/database_handler.dart';

class UsuarioController {
  Future<List<Map>> read() async {
    var db = await DatabaseHandler.instance.database;
    List<Map> doadores = await db.rawQuery("SELECT * FROM usuarios;");
    db.close();
    return doadores;
  }

  Future<List<Map>> readById(int id) async {
    var db = await DatabaseHandler.instance.database;
    List<Map> doador =
        await db.rawQuery("SELECT * FROM usuarios WHERE idUsuario == $id;");
    db.close();
    return doador;
  }

  void create(Usuario usuario) {}

  void update(Usuario usuario) {}

  void delete(Usuario usuario) {}
}
