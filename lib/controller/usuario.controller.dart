import 'package:doe_sangue/models/usuario.dart';

class UsuarioController {
  final usuarios = [
    Usuario(
        nome: 'João',
        email: 'joao@gmail.com',
        telefone: '1779939596',
        tipoSanguineo: "AB"),
  ];

  List<Usuario> read() {
    return usuarios;
  }

  void create(Usuario usuario) {
    usuarios.add(usuario);
  }

  void update(Usuario usuario) {}

  void delete(Usuario usuario) {}
}
