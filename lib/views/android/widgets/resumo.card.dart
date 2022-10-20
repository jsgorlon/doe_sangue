// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:doe_sangue/controller/usuario.controller.dart';
import 'package:doe_sangue/models/usuario.dart';
import 'package:flutter/material.dart';


class ResumoCard extends StatelessWidget {
  final usuarioController = UsuarioController();
  late TabController tabController;

  var myGroupTitle = AutoSizeGroup();
  var myGroupInfo = AutoSizeGroup();

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
              children: const [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                  ),
                  radius: 50.0,
                ),

                Text('Julia Silva', 
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Expanded(
                          child: Column(
                            children: [
                              AutoSizeText('TOTAL DE DOAÇÕES',
                              maxLines: 1,
                              group: myGroupTitle, 
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                              AutoSizeText('5',
                              maxLines: 1,
                              group: myGroupInfo, 
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),

                        Expanded(
                          child: Column(
                            children: [
                              AutoSizeText('ÚLTIMA DOAÇÃO',
                              maxLines: 1,
                              group: myGroupTitle, 
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                              AutoSizeText('22/08/2022',
                              maxLines: 1,
                              group: myGroupInfo, 
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        Expanded(
                          child: Column(
                            children: [
                              AutoSizeText('PRÓXIMA DOAÇÃO',
                              maxLines: 1,
                              group: myGroupTitle, 
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                              AutoSizeText('22/11/2022',
                              maxLines: 1,
                              group: myGroupInfo, 
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Expanded(
                          child: Column(
                            children: [
                              AutoSizeText('CRIOU',
                              maxLines: 1,
                              group: myGroupTitle, 
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                              AutoSizeText('1 CAMPANHA',
                              maxLines: 1,
                              group: myGroupInfo, 
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),

                        Expanded(
                          child: Column(
                            children: [
                              AutoSizeText('PARTICIPOU DE',
                              maxLines: 1,
                              group: myGroupTitle, 
                              style: TextStyle( 
                                fontSize: 22,                         
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                              AutoSizeText('3 CAMPANHAS',
                              maxLines: 1,
                              group: myGroupInfo, 
                              style: TextStyle( 
                                fontSize: 18,                         
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
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
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              _donationConfirmation(context)
                          ), // Next page address
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
  AlertDialog _donationConfirmation(BuildContext context) {
  return AlertDialog(
    title: const Text('Confirmar doação?',
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
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);           
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
