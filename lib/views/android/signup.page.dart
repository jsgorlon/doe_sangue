// ignore_for_file: use_key_in_widget_constructors

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';

var maskFormatterPhone = MaskTextInputFormatter(
  mask: '(##) #####-####', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);

var maskFormatterDate = MaskTextInputFormatter(
  mask: '##/##/####', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.redAccent,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        child: ListView(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Gênero",
                labelStyle: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              inputFormatters: [maskFormatterPhone],
              autofocus: true,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Telefone",
                labelStyle: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Tipo sanguíneo",
                labelStyle: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              inputFormatters: [maskFormatterDate],
              autofocus: true,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                labelText: "Data da última doação",
                labelStyle: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
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
                    "Cadastrar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: TextButton(
                child: const Text(
                  "Cancelar",
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
