import 'package:flutter/material.dart';

import '../../models/usuario.dart';

class DonorStats extends StatelessWidget {
  const DonorStats({super.key});

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
                    'https://thumbs.dreamstime.com/b/account-female-icon-128919363.jpg'),
              ),
              accountName: Text('Julia Silva'),
              accountEmail: Text('Email@email.com'),
            ),
            ListTile(
              title: Text('Campanhas'),
              onTap: () {
                /// Next page adress
              },
            ),
            ListTile(
              title: Text('Localizar Hemocentro'),
              onTap: () {
                /// Next page adress
              },
            ),
            ListTile(
              title: Text('Sobre a doação'),
              onTap: () {
                /// Next page adress
              },
            ),
            ListTile(
              title: Text('Minha conta'),
              onTap: () {
                /// Next page adress
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

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
