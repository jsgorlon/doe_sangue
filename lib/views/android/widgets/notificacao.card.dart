import 'package:flutter/material.dart';
import 'package:doe_sangue/controller/usuario.controller.dart';
import 'package:doe_sangue/models/usuario.dart';

class NotificacaoCard extends StatefulWidget {
  late TabController tabController;

  NotificacaoCard(this.tabController, {super.key});

  @override
  State<NotificacaoCard> createState() => _NotificacaoCardState();
}

class _NotificacaoCardState extends State<NotificacaoCard> {
  final usuarioController = UsuarioController();
  Future<List<Map>>? usuarios;

  var id = 3;

  @override
  void initState() {
    usuarios = usuarioController.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: usuarios,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) return Text(snapshot.error!.toString());
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
            itemBuilder: (_, index) {
              var usuarios = snapshot.data!;
              final usuario = Usuario.fromMap(usuarios[index]);
              return Align(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: ExpansionTile(
                      title: Text(
                          'ID: ${usuario.idUsuario}\n'
                          'Data cadastro: ${usuario.dataCadastro?.day}/${usuario.dataCadastro?.month}/${usuario.dataCadastro?.year}\n'
                          'Nascimento: ${usuario.dataNascimento?.day}/${usuario.dataNascimento?.month}/${usuario.dataNascimento?.year}\n'
                          'Nome: ${usuario.nomeUsuario}\n'
                          'Gênero: ${usuario.sexo}\n'),
                      textColor: Colors.redAccent,
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
      }
