import 'package:auto_size_text/auto_size_text.dart';
import 'package:doe_sangue/controller/local_coleta.controller.dart';
import 'package:doe_sangue/models/localColeta.dart';
import 'package:doe_sangue/models/usuario.dart';
import 'package:doe_sangue/views/android/widgets/donation.confirmation.dialong.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class AutonomusDonation extends StatefulWidget {
  Usuario sessionUser; //deverá ser feito de forma global
  AutonomusDonation(this.sessionUser, {super.key});

  @override
  State<AutonomusDonation> createState() => _AutonomusDonationState();
}

class _AutonomusDonationState extends State<AutonomusDonation> {
  LocalColetaController localColetaController = LocalColetaController();
  Future<List<Map>>? dadosLocais;
  List<LocalColeta>? locais;
  LocalColeta? selectedLocal;
  Map? currentLocation;
  String? currentCity;
  String? currentState;

  @override
  void initState() {
    dadosLocais = localColetaController.readByUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar doação')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 25),
              child: _localSelector(),
            ),
            if (selectedLocal != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      MapsLauncher.launchQuery(selectedLocal?.toMapsQuery());
                    }, // Next page address
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.redAccent,
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Abrir Mapa',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          DonationConfirmationDialog(
                        usuario: widget.sessionUser,
                        toHome: true,
                        confirmAction: print,
                        actionParam: "Cadastrado",
                      ),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.redAccent,
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Confirmar',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget _localSelector() {
    return FutureBuilder<List<Map<dynamic, dynamic>>>(
      future: dadosLocais,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) return Text(snapshot.error!.toString());

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data!.isEmpty) {
          return _noLocalAlert();
        }
        List<LocalColeta> items =
            snapshot.data!.map((v) => LocalColeta.fromMap(v)).toList();
        return DropdownButtonFormField<LocalColeta>(
          decoration: const InputDecoration(
            labelText: 'Locais de doação',
            prefixIcon: Icon(
              Icons.location_pin,
              color: Colors.redAccent,
            ),
            border: OutlineInputBorder(),
          ),
          value: (selectedLocal == null)
              ? items.first
              : (items.firstWhere((LocalColeta local) =>
                  local.idLocal == selectedLocal!.idLocal)),
          items: items.map<DropdownMenuItem<LocalColeta>>((LocalColeta local) {
            return DropdownMenuItem<LocalColeta>(
              value: local,
              child: Text("${local.nomeLocal}"),
            );
          }).toList(),
          onChanged: (local) {
            setState(() {
              selectedLocal = local;
              print(local?.nomeLocal);
            });
          },
        );
      },
    );
  }

  Widget _noLocalAlert() {
    return AlertDialog(
      title: const AutoSizeText(
        'Ponto de coleta não encontrado',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const AutoSizeText(
          textAlign: TextAlign.justify,
          'Desculpe, não há nenhum ponto de coleta cadastrado próximo da sua localização'),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
          },
          child: const Text(
            'Voltar',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
