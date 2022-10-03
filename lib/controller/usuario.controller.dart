import 'package:doe_sangue/models/usuario.dart';

class UsuarioController {
  final usuarios = [
    Usuario('João', 'joao@gmail.com', '1779939596', "AB", true),
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
