import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:doe_sangue/controller/local_coleta.controller.dart';
import 'package:doe_sangue/models/campanha.dart';
import 'package:doe_sangue/models/cidade.dart';
import 'package:doe_sangue/models/estado.dart';
import 'package:doe_sangue/models/localColeta.dart';
import 'package:flutter/material.dart';

const List<String> listaEstados = <String>['AM', 'SP'];

class CreateCampanha extends StatefulWidget {
  const CreateCampanha({super.key});

  @override
  State<CreateCampanha> createState() => _CreateCampanhaState();
}

class _CreateCampanhaState extends State<CreateCampanha> {
  final localController = LocalColetaController();
  bool hasReceptor = false;
  String? organizador; //Será o usuário do aplicativo
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

  final formKey = GlobalKey<FormState>();

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
  }

  Widget createButton() => ElevatedButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text("Criar"),
      );

  Widget checkBox() => Row(
        children: [
          Checkbox(
            activeColor: Colors.redAccent,
            checkColor: Colors.white,
            value: hasReceptor,
            onChanged: (bool? value) {
              setState(() {
                hasReceptor = value!;
              });
            },
          ),
          Text(
            "As doações serão para outra pessoa",
            style: TextStyle(fontSize: 18),
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
                labelText: 'Nᵒ Doações *',
                prefixIcon: Icon(
                  Icons.volunteer_activism,
                  color: Colors.redAccent,
                ),
                border: OutlineInputBorder(),
              ),
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return 'Valor obrigatório';
                }
              }),
            ),
          ),
          Container(
            child: Visibility(
              visible: hasReceptor,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Tipo sanguíneo"),
                onChanged: (value) {},
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
              child: TextFormField(
                enabled: hasReceptor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_add_alt_1_sharp),
                  border: OutlineInputBorder(),
                  hintText: 'Quem receberá a doação?',
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

          updateCidade(items.first.idEstado);

          return DropdownButtonFormField<Estado>(
            decoration: InputDecoration(
              labelText: 'Estado',
              border: OutlineInputBorder(),
            ),
            value: (selectedState == null)
                ? items.first
                : (items.firstWhere((Estado estado) =>
                    estado.idEstado == selectedState!.idEstado)),
            items: items.map<DropdownMenuItem<Estado>>((Estado estado) {
              return DropdownMenuItem<Estado>(
                child: Text("${estado.nomeEstado}"),
                value: estado,
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
      decoration: InputDecoration(
        labelText: 'Cidade',
        border: OutlineInputBorder(),
      ),
      value: (selectedCity == null)
          ? cidades!.first
          : (cidades!.firstWhere(
              (Cidade cidade) => cidade.idCidade == selectedCity!.idCidade)),
      items: cidades.isNotEmpty
          ? cidades!.map<DropdownMenuItem<Cidade>>((Cidade cidade) {
              return DropdownMenuItem<Cidade>(
                child: Text("${cidade.nomeCidade}"),
                value: cidade,
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
      decoration: InputDecoration(
        labelText: 'Local',
        border: OutlineInputBorder(),
      ),
      value: (selectedLocal == null)
          ? locaisColeta!.first
          : (locaisColeta!.firstWhere(
              (LocalColeta local) => local.idLocal == selectedLocal!.idLocal)),
      items: locaisColeta.isNotEmpty
          ? locaisColeta!
              .map<DropdownMenuItem<LocalColeta>>((LocalColeta local) {
              return DropdownMenuItem<LocalColeta>(
                child: Text("${local.nomeLocal}"),
                value: local,
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
        title: Text("Criar Campanha"),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              checkBox(),
              comboBox(),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: buildStates(),
              ),
              if (cidades.isNotEmpty) Container(child: buildCities()),
              if (locaisColeta.isNotEmpty) Container(child: buildLocal()),
              // buildCities(),
              // buildLocal(),
            ],
          ),
        ),
      ),
    );
  }
}
