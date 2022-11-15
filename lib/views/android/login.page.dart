import 'package:doe_sangue/controller/usuario.controller.dart';
import 'package:doe_sangue/views/android/TabbedHome.page.dart';
import 'package:doe_sangue/views/android/resetPassword.page.dart';
import 'package:doe_sangue/views/android/signup.page.dart';
import 'package:doe_sangue/models/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  final _conEmail = TextEditingController();
  final _conSenha = TextEditingController();

  login() async {
    String email = _conEmail.text;
    String senha = _conSenha.text;
    var usuarioController = UsuarioController();

      await usuarioController.loginUser(email, senha).then((usuario) {
        if (usuario != null) {
          setSP(usuario).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const TabbedHome()),
                (Route<dynamic> route) => false);
          });
        } 
      });    
  }

  Future setSP(Usuario usuario) async {
    final SharedPreferences sp = await _pref;

    sp.setString("nomeUsuario", usuario.nomeUsuario!);
    sp.setString("email", usuario.email!);
    sp.setInt("idUsuario", usuario.idUsuario!);

    print('${usuario.nomeUsuario}');
    print('${usuario.email}');
    print('${usuario.idUsuario}');
    }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _conEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _conSenha,
              keyboardType: TextInputType.text,
              obscureText: true,
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              style: const TextStyle(fontSize: 16),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text(
                  "Esqueceu sua senha?",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordPage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 40,
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
                  onPressed: login,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  )
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não possui uma conta?"),
                  TextButton(
                    child: const Text(
                      "Cadastre-se",
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
