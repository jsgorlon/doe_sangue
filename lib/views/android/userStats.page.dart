// ignore_for_file: prefer_const_constructors

//import 'package:doe_sangue/views/android/widgets/camapanha.card.dart';
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
                  children: const [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Icon(
                        Icons.volunteer_activism,
                        color: Colors.redAccent,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(
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
          
          //TELA 1 User Stats
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Column(
                children: [Container(                  
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/woman.png')), 
                    ),
                  ),

                Text('Julia Silva', 
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.redAccent,
                  ),
                ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Column(
                    children: const [
                      Text('TOTAL DE DOAÇÕES', 
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.redAccent,
                        ),
                      ),
                      Text('5', 
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        ),)
                    ],
                  ),

                  SizedBox(width: 32),

                  Column(
                    children: const [
                      Text('ÚLTIMA DOAÇÃO', 
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.redAccent,
                        ),
                      ),
                      Text('22/08/2022', 
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        ),)
                    ],
                  ),

                  SizedBox(width: 32),

                  Column(
                    children: const [
                      Text('PRÓXIMA DOAÇÃO', 
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.redAccent,
                        ),
                      ),
                      Text('22/11/2022', 
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        ),)
                    ],
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: null, // Next page address
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.redAccent,
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ), 
                    child: const Text('Registrar Doação',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(width: 32),

                  TextButton(
                    onPressed: null, // Next page address
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.redAccent,
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ), 
                    child: const Text('Criar Campanha',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),

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
