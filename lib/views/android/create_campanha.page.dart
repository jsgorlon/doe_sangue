import 'package:auto_size_text/auto_size_text.dart';
import 'package:doe_sangue/controller/campanha.controller.dart';
import 'package:doe_sangue/controller/local_coleta.controller.dart';
import 'package:doe_sangue/models/campanha.dart';
import 'package:doe_sangue/models/cidade.dart';
import 'package:doe_sangue/models/estado.dart';
import 'package:doe_sangue/models/localColeta.dart';
import 'package:doe_sangue/models/usuario.dart';
import 'package:flutter/material.dart';

class CreateCampanha extends StatefulWidget {
  Usuario? sessionUser;
  CreateCampanha({this.sessionUser, super.key});

  @override
  State<CreateCampanha> createState() => _CreateCampanhaState();
}

class _CreateCampanhaState extends State<CreateCampanha> {
  final localController = LocalColetaController();
  final campanhaController = CampanhaController();
  bool hasReceptor = false;
  String? receptor;
  String? tipoSanguineo;
  int? qtdBolsasSolicitadas;
  String? local;

  Future<List<Map>>? estados;
  Estado? selectedState;
  List<Cidade> cidades = [];
  Cidade? selectedCity;
  List<LocalColeta> locaisColeta = [];
  LocalColeta? selectedLocal;

  List<String> bloodTypes = <String>[
    "A+",
    "AB+",
    "B+",
    "O+",
    "A-",
    "AB-",
    "B-",
    "O-"
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    estados = localController.readEstados();
    super.initState();
  }

  void updateCidade(int? idEstado) async {
    selectedCity = null;
    cidades = [];

    var items = await localController.readCidade(idEstado);

    cidades = items
        .map(
          (e) => Cidade.fromMap(e),
        )
        .toList();
    setState(() {
      selectedCity = cidades.first;
      updateLocais(selectedCity?.idCidade);
    });
  }

  void updateLocais(int? idCidade) async {
    selectedLocal = null;
    locaisColeta = [];

    var items = await localController.readLocalById(idCidade!);

    locaisColeta = items
        .map(
          (e) => LocalColeta.fromMap(e),
        )
        .toList();
    setState(() {
      selectedLocal = locaisColeta.first;
    });
  }

  Widget checkBox() => Row(
        children: [
          Checkbox(
            activeColor: Colors.redAccent,
            checkColor: Colors.white,
            value: hasReceptor,
            onChanged: (bool? value) {
              setState(() {
                hasReceptor = value!;
                if (!hasReceptor) {
                  tipoSanguineo = null;
                  receptor = null;
                }
              });
            },
          ),
          const AutoSizeText(
            "As doa????es ser??o para outra pessoa",
            maxFontSize: 18,
          ),
        ],
      );

  Widget comboBox() => Wrap(
        spacing: 15,
        runSpacing: 15,
        children: [
          Container(
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'N??? Doa????es *',
                prefixIcon: Icon(
                  Icons.volunteer_activism,
                  color: Colors.redAccent,
                ),
                border: OutlineInputBorder(),
              ),
              validator: ((qtdBolsas) {
                if (qtdBolsas == null ||
                    qtdBolsas.isEmpty ||
                    int.parse(qtdBolsas) <= 0) {
                  return 'Valor obrigat??rio';
                } else {
                  return null;
                }
              }),
              onChanged: (qtdBolsas) {
                qtdBolsasSolicitadas = int.parse(qtdBolsas);
              },
            ),
          ),
          Container(
            child: Visibility(
              visible: hasReceptor,
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.bloodtype_sharp,
                      color: Colors.redAccent,
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Tipo sangu??neo"),
                onChanged: (value) {
                  tipoSanguineo = value;
                },
                value: bloodTypes.first,
                items: bloodTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(child: Text(value)),
                  );
                }).toList(),
              ),
            ),
          ),
          Visibility(
            visible: hasReceptor,
            child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o nome do receptor das doa????es';
                  } else {
                    return null;
                  }
                }),
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  receptor = value;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_add_alt_1_sharp,
                    color: Colors.redAccent,
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Quem receber?? a doa????o?',
                  labelText: 'Nome Receptor',
                ),
              ),
            ),
          )
        ],
      );

  Widget buildStates() {
    return Container(
      child: FutureBuilder<List<Map<dynamic, dynamic>>>(
        future: estados,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) return Text(snapshot.error!.toString());

          List<Estado> items =
              snapshot.data!.map((v) => Estado.fromMap(v)).toList();

          //updateCidade(items.first.idEstado);

          return DropdownButtonFormField<Estado>(
            decoration: const InputDecoration(
              labelText: 'Estado',
              prefixIcon: Icon(
                Icons.location_pin,
                color: Colors.redAccent,
              ),
              border: OutlineInputBorder(),
            ),
            value: (selectedState == null)
                ? items.first
                : (items.firstWhere((Estado estado) =>
                    estado.idEstado == selectedState!.idEstado)),
            items: items.map<DropdownMenuItem<Estado>>((Estado estado) {
              return DropdownMenuItem<Estado>(
                value: estado,
                child: Text("${estado.nomeEstado}"),
              );
            }).toList(),
            onChanged: (estado) {
              setState(() {
                selectedState = estado;
                selectedLocal = null;
                locaisColeta = [];

                updateCidade(estado?.idEstado);
              });
            },
          );
        },
      ),
    );
  }

  Widget buildCities() {
    return DropdownButtonFormField<Cidade>(
      decoration: const InputDecoration(
        labelText: 'Cidade',
        prefixIcon: Icon(
          Icons.location_city,
          color: Colors.redAccent,
        ),
        border: OutlineInputBorder(),
      ),
      value: (selectedCity == null)
          ? cidades.first
          : (cidades.firstWhere(
              (Cidade cidade) => cidade.idCidade == selectedCity!.idCidade)),
      items: cidades.isNotEmpty
          ? cidades.map<DropdownMenuItem<Cidade>>((Cidade cidade) {
              return DropdownMenuItem<Cidade>(
                value: cidade,
                child: Text("${cidade.nomeCidade}"),
              );
            }).toList()
          : [],
      onChanged: (cidade) => setState(() {
        selectedCity = cidade;
        updateLocais(cidade?.idCidade);
      }),
    );
  }

  Widget buildLocal() {
    return DropdownButtonFormField<LocalColeta>(
      decoration: const InputDecoration(
        labelText: 'Local',
        prefixIcon: Icon(
          Icons.business,
          color: Colors.redAccent,
        ),
        border: OutlineInputBorder(),
      ),
      value: (selectedLocal == null)
          ? locaisColeta.first
          : (locaisColeta.firstWhere(
              (LocalColeta local) => local.idLocal == selectedLocal!.idLocal)),
      items: locaisColeta.isNotEmpty
          ? locaisColeta
              .map<DropdownMenuItem<LocalColeta>>((LocalColeta local) {
              return DropdownMenuItem<LocalColeta>(
                value: local,
                child: Text("${local.nomeLocal}"),
              );
            }).toList()
          : [],
      onChanged: (local) => setState(() => selectedLocal = local),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar Campanha"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                checkBox(),
                comboBox(),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: buildStates(),
                ),
                if (cidades.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: buildCities(),
                  ),
                if (locaisColeta.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: buildLocal(),
                  ),
                if (selectedState != null &&
                    selectedCity != null &&
                    locaisColeta.isEmpty)
                  Container(
                    child: const Text("Pontos de coleta n??o encontrados"),
                  ),
                if (locaisColeta.isNotEmpty)
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.redAccent,
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Campanha campanha = Campanha(
                            organizador: widget.sessionUser,
                            nomeReceptor: receptor,
                            local: selectedLocal,
                            qtdSolicitada: qtdBolsasSolicitadas,
                            tipoSanguineo: tipoSanguineo ??
                                widget.sessionUser?.tipoSanguineo);
                        campanhaController.create(campanha);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Confirmar',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
