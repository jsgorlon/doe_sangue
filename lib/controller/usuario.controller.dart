import 'package:doe_sangue/models/usuario.dart';
import 'package:doe_sangue/services/database_handler.dart';

class UsuarioController {
  Future<List<Map>> read() async {
    var db = await DatabaseHandler.instance.database;
    List<Map> usuarios = await db.rawQuery("SELECT * FROM usuarios");
    return usuarios;
  }

  Future<List<Map>> readById(int id) async {
    var db = await DatabaseHandler.instance.database;
    List<Map> usuario =
        await db.rawQuery("""SELECT user.idUsuario, user.nomeUsuario, user.sexo,
              user.dataNascimento, user.email, user.telefone, user.tipoSanguineo,
              user.ativo, user.dataCadastro, COUNT(d.idDoador) AS totalDoacoes, 
              COUNT(d.idCampanha) as campParticipadas, COUNT(camp.idCriador) AS totalCampanhas,
              max(d.dataDoacao) as ultimaDoacao
              FROM usuarios as user
              LEFT JOIN campanhas as camp on camp.idCriador == user.idUsuario
              LEFT JOIN doacoes as d on user.idUsuario == d.idDoador
              WHERE idUsuario == $id;""");
    return usuario;
  }

  Future<void> create(Usuario usuario) async {
    var db = await DatabaseHandler.instance.database;
    await db.insert('usuarios', usuario.toMap());
  }

  Future<Usuario?> loginUser(String Email, String Senha) async {
    var db = await DatabaseHandler.instance.database;
    var usuario = await db.rawQuery(
        """ SELECT * FROM usuarios WHERE email = '$Email' AND senha = '$Senha';""");

    if (usuario.isNotEmpty) {
      return Usuario.fromMap(usuario.first);
    } else {
      return null;
    }
  }

  Future<void> updateUser(int? id, String? email, String? telefone) async {
    var db = await DatabaseHandler.instance.database;
    await db.rawQuery("""UPDATE usuarios
          SET email = '$email', telefone = '$telefone'
          WHERE idUsuario == $id;""");
  }

  void delete(Usuario usuario) {}
}
