import 'package:doe_sangue/controller/campanha.controller.dart';
import 'package:doe_sangue/controller/doacao.controller.dart';
import 'package:doe_sangue/controller/usuario.controller.dart';
import 'package:doe_sangue/models/campanha.dart';
import 'package:doe_sangue/models/doacao.dart';
import 'package:doe_sangue/models/usuario.dart';
import 'package:doe_sangue/services/location.service.dart';
import 'package:doe_sangue/views/android/widgets/donation.confirmation.dialong.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CampanhaCard extends StatefulWidget {
  late TabController tabController;

  CampanhaCard(this.tabController, {super.key});

  @override
  State<CampanhaCard> createState() => _CampanhaCardState();
}

class _CampanhaCardState extends State<CampanhaCard> {
  final campanhaController = CampanhaController();
  final LocationServices locator = LocationServices();
  final DoacaoController doacaoController = DoacaoController();
  final UsuarioController usuarioController = UsuarioController();

  String? currentCity;
  Future<List<Map>>? campanhas;
  List<Usuario> usuarios = [];
  Usuario? sessionUser;

  @override
  void initState() {
    campanhas = campanhaController.read();
    getLocation();
    fetchUsers();
    super.initState();
  }

  void getLocation() async {
    await locator.getCurrentLocation();
    if (mounted) {
      setState(
        () {
          currentCity = locator.city;
        },
      );
    }
  }

  Future<void> _refresh() {
    if (mounted) {
      setState(
        () {
          campanhas = campanhaController.read();
        },
      );
    }
    return Future.delayed(
      const Duration(seconds: 1),
    );
  }

  void fetchUsers() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int id = sp.getInt("idUsuario")!;
    usuarios = [];
    sessionUser = null;

    var results = await usuarioController.readById(id);
    usuarios = results
        .map(
          (e) => Usuario.fromMap(e),
        )
        .toList();
    if (mounted) {
      setState(
        () {
          sessionUser = usuarios.first;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<dynamic, dynamic>>>(
      future: campanhas,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) return Text(snapshot.error!.toString());
        return RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
            itemBuilder: (_, index) {
              var campanhas = snapshot.data!;
              final campanha = Campanha.fromMap(campanhas[index]);
              getLocation();
              return Align(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: ExpansionTile(
                      title: Text(
                          'Organizador: ${campanha.organizador!.nomeUsuario}'),
                      subtitle: _cardSubtitle(campanha),
                      textColor: Colors.redAccent,
                      children: [
                        _cardDetails(context, campanha),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _cardSubtitle(Campanha campanha) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Receptor: ${campanha.nomeReceptor ?? campanha.organizador!.nomeUsuario!}'),
        Text(
            'Cidade: ${campanha.local?.cidade?.nomeCidade}/${campanha.local?.cidade?.estado?.siglaUF}')
      ],
    );
  }

  Widget _cardDetails(BuildContext context, Campanha campanha) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Local: ${campanha.local?.nomeLocal}'),
              Text('Doações: ${campanha.qtdDoada}/${campanha.qtdSolicitada}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Iniciada em: ${campanha.dataInicio?.day}/${campanha.dataInicio?.month}/${campanha.dataInicio?.year}'),
              Text('Tipo: ${campanha.tipoSanguineo}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: (currentCity == campanha.local!.cidade!.nomeCidade)
                    ? true
                    : false,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        DonationConfirmationDialog(
                      sessionUser: sessionUser!,
                      campanha: campanha,
                      ifSuccessAction: doacaoController.create,
                      actionParam:
                          Doacao(usuario: sessionUser!, campanha: campanha),
                    ),
                  ).then((value) {
                    widget.tabController.animateTo(0);
                  }),
                  child: const Text('Registrar Doação'),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                  onPressed: (() {
                    MapsLauncher.launchQuery(campanha.local!.toMapsQuery());
                  }),
                  child: const Text("Abrir Mapa")),
            ],
          )
        ],
      ),
    );
  }
}
