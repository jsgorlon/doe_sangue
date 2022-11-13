// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:maps_launcher/maps_launcher.dart';
import 'package:doe_sangue/views/android/widgets/campanha.card.dart';
import 'package:doe_sangue/views/android/widgets/resumo.card.dart';
import 'package:doe_sangue/views/android/widgets/notificacao.card.dart';
import 'package:flutter/material.dart';

import '../../models/usuario.dart';

class TabbedHome extends StatefulWidget {
  const TabbedHome({super.key});

  @override
  State<TabbedHome> createState() => _TabbedHomeState();
}

class _TabbedHomeState extends State<TabbedHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoeSangue'),
        iconTheme: const IconThemeData(
          color: Colors.redAccent,
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.redAccent,
          tabs: [
            Tab(
              text: 'Resumo',
              icon: SizedBox(
                height: 40,
                width: 60,
                child: Icon(
                  Icons.query_stats_rounded,
                  color: Colors.redAccent,
                  size: 35,
                ),
              ),
            ),
            Tab(
              text: 'Campanhas',
              icon: SizedBox(
                height: 40,
                width: 60,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: const Icon(
                        Icons.volunteer_activism,
                        color: Colors.redAccent,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: const Icon(
                        Icons.search_outlined,
                        color: Colors.redAccent,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Tab(
              text: 'Notificações',
              icon: SizedBox(
                height: 40,
                width: 60,
                child: Icon(
                  Icons.notifications,
                  color: Colors.redAccent,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          //TELA 1 Resumo
          ResumoCard(_tabController),

          //TELA 2 Campanhas
          CampanhaCard(_tabController),

          //TELA 3 Notificações
          NotificacaoCard(_tabController),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(171, 185, 47, 47),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                ),
              ),
              accountName: Text('Julia Silva'), //user data
              accountEmail: Text('email@email.com'), //user data
            ),
            ListTile(
              title: Text('Minha conta'),
              onTap: () {
                Navigator.of(context).pushNamed('/profile');
              },
            ),
            ListTile(
              title: Text('Localizar Hemocentro'),
              onTap: () {
                MapsLauncher.launchQuery('hemocentro');
              },
            ),
            ListTile(
              title: Text('Sobre a doação'),
              onTap: () {
                Navigator.of(context).pushNamed('/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}
