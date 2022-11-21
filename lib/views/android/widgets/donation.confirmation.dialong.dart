import 'package:doe_sangue/models/campanha.dart';
import 'package:doe_sangue/models/usuario.dart';
import 'package:doe_sangue/views/android/TabbedHome.page.dart';
import 'package:flutter/material.dart';

class DonationConfirmationDialog extends StatelessWidget {
  Usuario sessionUser;
  Function ifSuccessAction;
  var actionParam;
  Campanha? campanha;

  DonationConfirmationDialog(
      {super.key,
      required this.sessionUser,
      required this.ifSuccessAction,
      required this.actionParam,
      this.campanha});

  @override
  Widget build(BuildContext context) {
    if (sessionUser.daysToNestDonation() > 0 || !sessionUser.canDonateByAge()) {
      String alterta = (!sessionUser.canDonateByAge())
          ? 'Você está fora da idade permitida para doação'
          : 'Ainda faltam ${sessionUser.daysToNestDonation()} dias para sua próxima doação';
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
    } else if (campanha != null &&
        !__isBloodCompatible(sessionUser, campanha!)) {
      return AlertDialog(
        title: const Text(
          'Tipo sanguíneo não compatível',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
            textAlign: TextAlign.justify,
            'Tipo sanguíneo não é compatível com esta campanha'),
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
            onPressed: (() {
              Navigator.pop(context);
            }),
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
              ifSuccessAction(actionParam);
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
  }

  bool __isBloodCompatible(Usuario sessionUser, Campanha campaign) {
    if (sessionUser.tipoSanguineo!.startsWith('A') &&
        !campaign.tipoSanguineo!.startsWith('A')) {
      return false;
    }
    if (sessionUser.tipoSanguineo!.contains('B') &&
        !campaign.tipoSanguineo!.contains('B')) {
      return false;
    }
    if (sessionUser.tipoSanguineo!.startsWith('AB') &&
        !campaign.tipoSanguineo!.startsWith('AB')) {
      return false;
    }
    if (sessionUser.tipoSanguineo!.contains('+') &&
        campaign.tipoSanguineo!.contains('-')) {
      return false;
    }
    return true;
  }
}
