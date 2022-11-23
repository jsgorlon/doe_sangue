// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:doe_sangue/controller/usuario.controller.dart';
import 'package:doe_sangue/models/usuario.dart';
import 'package:doe_sangue/views/android/TabbedHome.page.dart';
import 'package:doe_sangue/views/android/update.page.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var myGroupTitle = AutoSizeGroup();
  var myGroupInfo = AutoSizeGroup();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.redAccent,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => TabbedHome(),
                ),
              );
            }),
      ),
      body: ListView.builder(
          itemCount: usuarios.length,
          itemBuilder: (_, index) {
            var usuario = Usuario.fromMap(usuarios[index]);
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.redAccent,
                            Colors.pinkAccent,
                          ],
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
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
                                      fontSize: 24.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                color: Colors.white,
                                elevation: 5.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 22.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            AutoSizeText(
                                              "Sexo",
                                              maxLines: 1,
                                              group: myGroupTitle,
                                              style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            AutoSizeText(
                                              '${usuario.sexo}',
                                              maxLines: 1,
                                              group: myGroupInfo,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.pinkAccent,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            AutoSizeText(
                                              "Tipo Sanguíneo",
                                              maxLines: 1,
                                              group: myGroupTitle,
                                              style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            AutoSizeText(
                                              '${usuario.tipoSanguineo}',
                                              maxLines: 1,
                                              group: myGroupInfo,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.pinkAccent,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            AutoSizeText(
                                              "Nascimento",
                                              maxLines: 1,
                                              group: myGroupTitle,
                                              style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            AutoSizeText(
                                              '${usuario.dataNascimento?.day}/${usuario.dataNascimento?.month}/${usuario.dataNascimento?.year}',
                                              maxLines: 1,
                                              group: myGroupInfo,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.pinkAccent,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Wrap(
                        runSpacing: 10,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                "Dados da conta:",
                                style: TextStyle(
                                  color: Color.fromARGB(228, 255, 255, 255),
                                  fontStyle: FontStyle.normal,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Email: ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.redAccent,
                                ),
                              ),
                              Text(
                                '${usuario.email}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Telefone: ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.redAccent,
                                ),
                              ),
                              Text(
                                '${usuario.telefone}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdatePage(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            fixedSize: const Size(100, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Text(
                            "Editar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]);
          }),
    );
  }
}
