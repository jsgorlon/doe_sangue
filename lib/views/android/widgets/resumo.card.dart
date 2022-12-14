// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:doe_sangue/controller/usuario.controller.dart';
import 'package:doe_sangue/models/usuario.dart';
import 'package:doe_sangue/views/android/add_donation.page.dart';
import 'package:doe_sangue/views/android/create_campanha.page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResumoCard extends StatefulWidget {
  late TabController tabController;

  ResumoCard(this.tabController);

  @override
  State<ResumoCard> createState() => _ResumoCardState();
}

class _ResumoCardState extends State<ResumoCard> {
  final usuarioController = UsuarioController();
  List<Map> usuarios = [];

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  void fetchUsers() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int id = sp.getInt("idUsuario")!;

    var results = await usuarioController.readById(id);
    setState(() {
      usuarios = results.toList();
    });
  }

  var myGroupTitle = AutoSizeGroup();
  var myGroupInfo = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(top: 40, bottom: 40),
        itemCount: usuarios.length,
        itemBuilder: (_, index) {
          var usuario = Usuario.fromMap(usuarios[index]);
          return SizedBox(
            height: MediaQuery.of(context).size.height - 250,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/noPhoto.png'),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    AutoSizeText(
                                      'TOTAL DE DOA????ES',
                                      maxLines: 1,
                                      group: myGroupTitle,
                                      maxFontSize: 22,
                                      style: TextStyle(
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
                                      '??LTIMA DOA????O',
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
                                          ? 'Nenhuma doa????o registrada'
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
                                      'PR??XIMA DOA????O',
                                      maxLines: 1,
                                      group: myGroupTitle,
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    AutoSizeText(
                                      (usuario.daysToNestDonation() > 0)
                                          ? 'Faltam ${usuario.daysToNestDonation()} dia(s)'
                                          : 'Doe agora!',
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      '${usuario.totalCampanhas ?? 0} CAMPANHA(S)',
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
                                      '${usuario.campParticipadas ?? 0} CAMPANHA(S)',
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AutonomusDonation(usuario),
                                  ),
                                ).then((_) => fetchUsers());
                              }),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.redAccent,
                                fixedSize: const Size(150, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: const Text(
                                'Registrar Doa????o',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateCampanha(
                                      sessionUser: usuario,
                                    ),
                                  ),
                                ).then((_) => fetchUsers());
                              }),
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
  }
}
