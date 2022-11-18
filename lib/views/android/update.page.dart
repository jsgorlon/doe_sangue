// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously

import 'package:doe_sangue/controller/usuario.controller.dart';
import 'package:doe_sangue/views/android/profile.page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/usuario.dart';

var maskFormatterPhone = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

class UpdatePage extends StatefulWidget {
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? email;
  String? telefone;
  int? id;
  String? senha;

  final formKey = GlobalKey<FormState>();

  void update(BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int id = sp.getInt("idUsuario")!;

    formKey.currentState!.save();
    var usuarioController = UsuarioController();
    usuarioController.updateUser(id, email, telefone);

    var results = await usuarioController.readById(id);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(),
      ),
    );

    setState(() {
      usuarios = results.toList();
    });
  }

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
        title: const Text('Alterar Dados'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.redAccent,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
          child: ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (_, index) {
                var usuario = Usuario.fromMap(usuarios[index]);
                return Column(children: [
                  TextFormField(
                    initialValue: '${usuario.email}',
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    onSaved: (adress) => email = adress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: '${usuario.telefone}',
                    inputFormatters: [maskFormatterPhone],
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      labelText: "Telefone",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    onSaved: (phone) => telefone = phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: SizedBox.expand(
                      child: TextButton(
                        child: const Text(
                          "Salvar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () => update(context),
                      ),
                    ),
                  ),
                ]);
              }),
        ),
      ),
    );
  }
}
