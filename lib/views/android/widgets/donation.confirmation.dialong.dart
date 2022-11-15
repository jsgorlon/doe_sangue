import 'package:doe_sangue/models/usuario.dart';
import 'package:flutter/material.dart';

class DonationConfirmationDialog extends StatelessWidget {
  Usuario? usuario; //derá ser o usuário da seesão para as verificações
  Function confirmAction;
  var actionParam;
  bool toHome;
  DonationConfirmationDialog(
      {super.key,
      this.usuario,
      required this.confirmAction,
      required this.actionParam,
      this.toHome = true});

  @override
  Widget build(BuildContext context) {
    if (usuario!.daysToNestDonation() > 0 || !usuario!.canDonateByAge()) {
      String alterta = (!usuario!.canDonateByAge())
          ? 'Você está fora da idade permitida para doação'
          : 'Ainda faltam ${usuario!.daysToNestDonation()} dias para sua próxima doação';
      return AlertDialog(
        title: const Text(
          'Não é possível realizar a doação',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(textAlign: TextAlign.justify, alterta),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: const Text(
          'Confirmar doação?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
            textAlign: TextAlign.justify,
            'Uma vez confirmada, você só podera doar novamente após o perídodo de recuperação'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancelar',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {
              confirmAction(actionParam);
              Navigator.pop(context);
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
      );
    }
    ;
  }
}
