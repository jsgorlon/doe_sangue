import 'package:flutter/material.dart';

const List<String> listaEstados = <String>['AM', 'SP'];

class CreateCampanha extends StatelessWidget {
  String? organizador; //Sera o usuário do aplicativo
  String? receptor;
  String? tipoSanguineo;
  //bool? tipoPositivo;
  int? qtdBolsasSolicitadas;
  int? qtdBolsasDoadas;
  String? local;
  String? cidade;
  String? estado;
  DateTime? dataInicio;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Campanha"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 55, 5),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person_add_alt_1_sharp),
                  hintText: 'Quem receberá a doação?',
                  labelText: 'Nome Receptor *',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                  width: 115,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.bloodtype_sharp),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                  width: 60,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                  width: 168,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nᵒ Doações *',
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 115,
                  padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.location_pin),
                        labelText: 'UF *'),
                  ),
                ),
                Container(
                  width: 228,
                  padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cidade *',
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 55, 5),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.location_city_sharp),
                    labelText: 'Local *',
                    hintText: 'Onde será a doação?'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Criar Campanha"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
