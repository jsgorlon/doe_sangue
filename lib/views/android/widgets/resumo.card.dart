// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:doe_sangue/controller/usuario.controller.dart';
import 'package:doe_sangue/models/usuario.dart';
import 'package:flutter/material.dart';

class ResumoCard extends StatefulWidget {
  late TabController tabController;

  ResumoCard(this.tabController);

  @override
  State<ResumoCard> createState() => _ResumoCardState();
}

class _ResumoCardState extends State<ResumoCard> {
  final usuarioController = UsuarioController();
  Future<List<Map>>? usuarios;

  var id = 1;

  @override
  void initState() {
    usuarios = usuarioController.readById(id);
    super.initState();
  }

  var myGroupTitle = AutoSizeGroup();
  var myGroupInfo = AutoSizeGroup();

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
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                var usuarios = snapshot.data!;
                final usuario = Usuario.fromMap(usuarios[index]);
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 250,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXA-Uu5DzOUC3DEEh789elx46nvfe-0s-7xg&usqp=CAU",
                              ),
                              radius: 50.0,
                            ),
                            Text(
                              '${usuario.nomeUsuario}',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          AutoSizeText(
                                            'TOTAL DE DOAÇÕES',
                                            maxLines: 1,
                                            group: myGroupTitle,
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          AutoSizeText(
                                            '${usuario.totalDoacoes}',
                                            maxLines: 1,
                                            group: myGroupInfo,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          AutoSizeText(
                                            'ÚLTIMA DOAÇÃO',
                                            maxLines: 1,
                                            group: myGroupTitle,
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          AutoSizeText(
                                            usuario.ultimaDoacao == null
                                                ? 'Nenhuma doação registrada'
                                                : '${usuario.ultimaDoacao?.day}/${usuario.ultimaDoacao?.month}/${usuario.ultimaDoacao?.year}',
                                            maxLines: 1,
                                            group: myGroupInfo,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          AutoSizeText(
                                            'PRÓXIMA DOAÇÃO',
                                            maxLines: 1,
                                            group: myGroupTitle,
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          AutoSizeText(
                                            '',
                                            maxLines: 1,
                                            group: myGroupInfo,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          AutoSizeText(
                                            'CRIOU',
                                            maxLines: 1,
                                            group: myGroupTitle,
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          AutoSizeText(
                                            usuario.totalCampanhas == 0
                                                ? 'Este usuário não criou nenhuma campanha'
                                                : '${usuario.totalCampanhas} CAMPANHA(S)',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            group: myGroupInfo,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          AutoSizeText(
                                            'PARTICIPOU DE',
                                            maxLines: 1,
                                            group: myGroupTitle,
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          AutoSizeText(
                                            usuario.campParticipadas == 0
                                                ? 'Este usuário não participou de nenhuma campanha'
                                                : '${usuario.campParticipadas} CAMPANHA(S)',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            group: myGroupInfo,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () => showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _donationConfirmation(
                                                context)), // Next page address
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.redAccent,
                                      fixedSize: const Size(150, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                    child: const Text(
                                      'Registrar Doação',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.of(context)
                                        .pushNamed('/createCampanha'),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.redAccent,
                                      fixedSize: const Size(150, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                    child: const Text(
                                      'Criar Campanha',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                );
              });
        });
  }

  AlertDialog _donationConfirmation(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Confirmar doação?',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
          textAlign: TextAlign.justify,
          'Uma vez confirmada, você só podera doar novamente após o perídodo de recuperação'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
