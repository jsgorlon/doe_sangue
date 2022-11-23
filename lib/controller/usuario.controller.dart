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
        await db.rawQuery("""SELECT usuarios.idUsuario, usuarios.nomeUsuario, usuarios.sexo,
              usuarios.dataNascimento, usuarios.email, usuarios.telefone, usuarios.tipoSanguineo,
              usuarios.ativo, usuarios.dataCadastro, 

              (SELECT COUNT(d.idDoador) FROM doacoes as d
              WHERE idDoador = '$id') AS totalDoacoes,

              (SELECT COUNT(d.idCampanha) FROM doacoes as d
              WHERE idDoador = '$id') AS campParticipadas,

              (SELECT COUNT(camp.idCriador) FROM campanhas as camp
              WHERE idCriador = '$id') AS totalCampanhas,

              (SELECT max(d.dataDoacao) as ultimaDoacao FROM doacoes as d
              WHERE idDoador = '$id') AS ultimaDoacao              

              FROM usuarios
              WHERE idUsuario = '$id';""");
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
