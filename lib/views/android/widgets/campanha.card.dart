import 'package:doe_sangue/controller/campanha.controller.dart';
import 'package:doe_sangue/models/campanha.dart';
import 'package:flutter/material.dart';

class CampanhaCard extends StatelessWidget {
  final campanhaController = CampanhaController();
  late TabController tabController;

  CampanhaCard(this.tabController);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: campanhaController.read().length,
      itemBuilder: (_, index) {
        final campanha = campanhaController.read()[index];
        return Align(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: ExpansionTile(
                title: Text('Organizador: ${campanha.organizador!.nome!}'),
                subtitle: _cardSubtitle(campanha),
                backgroundColor: Color.fromARGB(171, 185, 47, 47),
                children: [
                  _cardDetails(context, campanha),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _cardSubtitle(Campanha campanha) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Receptor: ${campanha.receptor ?? campanha.organizador!.nome!}'),
          Text('Cidade : ${campanha.cidade}/ ${campanha.estado}')
        ],
      ),
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
              Text('Local: ${campanha.local}'),
              Text(
                  'Doações: ${campanha.qtdBolsasDoadas}/${campanha.qtdBolsasSolicitadas}'),
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
            child: Text('Registrar Doação'),
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
          'Uma fez confirmada você só podera doar novamente após o perídodo de recuperação'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            tabController.animateTo(0);
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
