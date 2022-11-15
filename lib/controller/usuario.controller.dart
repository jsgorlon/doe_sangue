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
    List<Map> usuario = await db.rawQuery("""SELECT user.nomeUsuario, user.sexo,
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

  void update(Usuario usuario) {}

  void delete(Usuario usuario) {}
}
