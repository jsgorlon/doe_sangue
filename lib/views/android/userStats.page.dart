import 'package:flutter/material.dart';

import '../../models/usuario.dart';

class UserStatsPage extends StatelessWidget {
  const UserStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://thumbs.dreamstime.com/b/account-female-icon-128919363.jpg',
                ),
              ),
              accountName: Text('Julia Silva'), //user data
              accountEmail: Text('Email@email.com'), //user data
            ),
            ListTile(
              title: Text('Campanhas'),
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
            ListTile(
              title: Text('Minha conta'),
              onTap: () {
                /// Next page address
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('DoeSangue'),
      ),
    );
  }
}
