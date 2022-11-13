// ignore_for_file: use_key_in_widget_constructors

import 'package:doe_sangue/controller/usuario.controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/usuario.dart';

var maskFormatterPhone = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController birthdate = TextEditingController();

  String? nomeUsuario;
  String? sexo;
  DateTime? dataNascimento;
  String? email;
  String? telefone;
  String? tipoSanguineo;
  String? senha;

  final formKey = GlobalKey<FormState>();

  void save(BuildContext context) async {
    formKey.currentState!.save();
    var usuarioController = UsuarioController();
    usuarioController.create(Usuario(nomeUsuario, sexo, dataNascimento, email,
        telefone, tipoSanguineo, senha));
    Navigator.of(context).pop();
  }

  stringToData(String data) {
    dataNascimento = DateTime.parse(data);
  }

  @override
  void initState() {
    super.initState();
  }

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
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.redAccent,
                    fontSize: 16,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 16,
                ),
                onSaved: (name) => nomeUsuario = name,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: birthdate,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: "Data de nascimento"),
                readOnly: true,
                onTap: () async {
                  DateTime? birthDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (birthDate != null) {
                    String date = DateFormat('yyyy-MM-dd').format(birthDate);
                    setState(() {
                      birthdate.text = date;
                    });
                  }
                },
                onSaved: (date) => stringToData(date!),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  icon: FaIcon(FontAwesomeIcons.venusMars),
                  labelText: "Gênero",
                  labelStyle: TextStyle(fontSize: 16, color: Colors.white),
                ),
                items: <String>['Masculino', 'Feminino']
                    .map<DropdownMenuItem<String>>((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(
                      gender,
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                }).toList(),
                onChanged: (String? gender) {},
                onSaved: (gender) => sexo = gender,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
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
                height: 10,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.bloodtype),
                  labelText: "Tipo sanguíneo",
                  labelStyle: TextStyle(fontSize: 16, color: Colors.white),
                ),
                items: <String>[
                  'A+',
                  'B+',
                  'AB+',
                  'O+',
                  'A-',
                  'B-',
                  'AB-',
                  'O-'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {},
                onSaved: (type) => tipoSanguineo = type,
              ),
              const SizedBox(
                height: 10,
              ),

              /*TextFormField(                
                controller: dateinput,
                decoration: const InputDecoration( 
                    icon: Icon(Icons.calendar_today),
                    labelText: "Data da última doação" 
                    ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, 
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950), 
                      lastDate: DateTime.now(),
                  );
      
                if(pickedDate != null ){                     
                      String value = DateFormat('dd/MM/yyyy').format(pickedDate);                      
                    setState(() {
                      dateinput.text = value;
                      }
                    );                
                  }
                },
                onSaved: (value) => ultimaDoacao = value as DateTime?,
              ),
      
              const SizedBox(
                height: 10,
                ),*/

              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                style: const TextStyle(fontSize: 16),
                onSaved: (password) => senha = password,
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
                    child: const Text(
                      "Cadastrar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () => save(context),
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
                    const Text('Já possui uma conta?'),
                    TextButton(
                      child: const Text(
                        "Faça o login",
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
