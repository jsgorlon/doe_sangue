// ignore_for_file: prefer_const_constructors

import 'package:doe_sangue/views/android/widgets/camapanha.card.dart';
import 'package:flutter/material.dart';

import '../../models/usuario.dart';

class UserStatsPage extends StatelessWidget {
  const UserStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoeSangue'),
        iconTheme: const IconThemeData(
          color: Colors.redAccent,
        ),
        bottom: TabBar(
          indicatorColor: Colors.redAccent,
          tabs: [
            Tab(
              icon: Icon(
                Icons.query_stats_rounded,
                color: Colors.redAccent,
              ),
            ),
            Tab(
              icon: SizedBox(
                height: 40,
                width: 40 * 1.5,
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
              icon: Icon(
                Icons.notifications,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Text('Tela1'),
          Text('Tela2'),
          Text('Tela2'),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://thumbs.dreamstime.com/b/account-female-icon-128919363.jpg',
                ),
              ),
              accountName: Text('Julia Silva'), //user data
              accountEmail: Text('Email@email.com'), //user data
            ),
            ListTile(
              title: Text('Minha conta'),
              onTap: () {
                /// Next page address
              },
            ),
            ListTile(
              title: Text('Localizar Hemocentro'),
              onTap: () {
                /// Next page address
              },
            ),
            ListTile(
              title: Text('Sobre a doação'),
              onTap: () {
                /// Next page address
              },
            ),
          ],
        ),
      ),
    );
  }
}
