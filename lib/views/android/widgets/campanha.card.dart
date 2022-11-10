import 'package:doe_sangue/controller/campanha.controller.dart';
import 'package:doe_sangue/models/campanha.dart';
import 'package:flutter/material.dart';

class CampanhaCard extends StatefulWidget {
  late TabController tabController;

  CampanhaCard(this.tabController, {super.key});

  @override
  State<CampanhaCard> createState() => _CampanhaCardState();
}

class _CampanhaCardState extends State<CampanhaCard> {
  final campanhaController = CampanhaController();
  Future<List<Map>>? campanhas;

  @override
  void initState() {
    campanhas = campanhaController.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: campanhas,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) return Text(snapshot.error!.toString());
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
            itemBuilder: (_, index) {
              var campanhas = snapshot.data!;
              final campanha = Campanha.fromMap(campanhas[index]);
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
          );
        });
  }

  Widget _cardSubtitle(Campanha campanha) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            'Receptor: ${campanha.nomeReceptor ?? campanha.organizador!.nomeUsuario!}'),
        Text('Cidade: ${campanha.local?.nomeCidade}/${campanha.local?.siglaUF}')
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
          ElevatedButton(
            onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
                    _donationConfirmation(context)),
            child: const Text('Registrar Doação'),
          )
        ],
      ),
    );
  }

  AlertDialog _donationConfirmation(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmar doação?'),
      content: const Text(
          textAlign: TextAlign.justify,
          'Uma vez confirmada, você só podera doar novamente após o perídodo de recuperação'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            widget.tabController.animateTo(0);
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
