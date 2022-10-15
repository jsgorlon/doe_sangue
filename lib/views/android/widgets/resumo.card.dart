// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:doe_sangue/controller/usuario.controller.dart';
import 'package:doe_sangue/models/usuario.dart';
import 'package:flutter/material.dart';

class ResumoCard extends StatelessWidget {
  final usuarioController = UsuarioController();
  late TabController tabController;

  ResumoCard(this.tabController);

  @override
  Widget build(BuildContext context) {
    return 
          Container(
            padding: const EdgeInsets.only(top: 40, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(                  
                  children: [
                    Container(                  
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/woman.png')
                        ), 
                      ),
                    ),

                    const Text('Julia Silva', 
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  fontSize: 16,
                                  color: Colors.white,
                                  ),
                                )
                              ],
                            ),

                            

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
                                  fontSize: 16,
                                  color: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            

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
                                  fontSize: 16,
                                  color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Column(
                              children: const [
                                Text('CRIOU', 
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.redAccent,
                                  ),
                                ),
                                Text('1 CAMPANHA', 
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  ),
                                )
                              ],
                            ),

                            Column(
                              children: const [
                                Text('PARTICIPOU DE', 
                                style: TextStyle( 
                                  fontSize: 16,                         
                                  color: Colors.redAccent,
                                  ),
                                ),
                                Text('3 CAMPANHAS', 
                                style: TextStyle( 
                                  fontSize: 16,                         
                                  color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),                

                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,                
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

                          TextButton(
                            onPressed: () => Navigator.of(context)
                                .pushNamed('/createCampanha'),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.redAccent,
                              fixedSize: const Size(150, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: const Text(
                              'Criar Campanha',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ); 
  }
}
