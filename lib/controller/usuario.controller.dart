import 'package:doe_sangue/models/usuario.dart';
import 'package:doe_sangue/services/database_handler.dart';


class UsuarioController {

  Future<List<Map>> read() async {
    var db = await DatabaseHandler.instance.database;
    List<Map> usuarios = await db.rawQuery("SELECT * FROM usuarios;");
    db.close();
    return usuarios;
  }

  Future<List<Map>> readById(int id) async {
    var db = await DatabaseHandler.instance.database;
    List<Map> usuario =
        await db.rawQuery("SELECT * FROM usuarios WHERE idUsuario == $id;");
        db.close();
    return usuario;
  }

  Future<void> create(Usuario usuario) async {
    var db = await DatabaseHandler.instance.database;
    await db.insert('usuarios', usuario.toMap());
    db.close();

    return(print('$usuario'));
  }

  void update(Usuario usuario) {}

  void delete(Usuario usuario) {}
}