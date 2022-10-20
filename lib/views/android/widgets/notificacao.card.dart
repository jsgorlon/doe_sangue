import 'package:doe_sangue/controller/campanha.controller.dart';
import 'package:doe_sangue/models/campanha.dart';
import 'package:flutter/material.dart';

class NotificacaoCard extends StatelessWidget {
  final campanhaController = CampanhaController();
  late TabController tabController;

  NotificacaoCard(this.tabController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Tela de notificação!!',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          )
        ),
      ],
    );
  }
}