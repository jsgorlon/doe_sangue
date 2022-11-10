// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var myGroupTitle = AutoSizeGroup();
  var myGroupInfo = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.redAccent,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Column(
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
                              backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXA-Uu5DzOUC3DEEh789elx46nvfe-0s-7xg&usqp=CAU",
                              ),
                              radius: 50.0,
                            ),
                            Text(
                              "Julia Silva",
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      AutoSizeText(
                                        "Doações",
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
                                        "5",
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
                                        "O+",
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
                                        "14/11/1996",
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
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
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
                          "email@email.com",
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
                          "(17) 99166-7889",
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
                          "Estado: ",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.redAccent,
                          ),
                        ),
                        Text(
                          "SP",
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
                          "Cidade: ",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.redAccent,
                          ),
                        ),
                        Text(
                          "São José do Rio Preto",
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
                    onPressed: () {},
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
          ]),
    );
  }
}
