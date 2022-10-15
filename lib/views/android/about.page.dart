import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('F.A.Q'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.redAccent,
            onPressed: () => Navigator.pop(context, false),
          ),
        ),

        body: 
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Align(
            child: Container(
              padding: const EdgeInsets.only(top: 5),
              width: MediaQuery.of(context).size.width - 20,
              child: Card(
                color: const Color.fromARGB(255, 95, 94, 94),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Column(                                  
                  children: const [

                    Card(
                      margin: EdgeInsets.all(5),
                      child: ExpansionTile(                       
                      title: Text('O que é a doação de sangue?', 
                        style: TextStyle(                          
                          fontSize: 18,
                        ),                        
                      ),
                      textColor: Colors.redAccent,                      
                      children: [
                        ListTile(title: Text('A doação de sangue é um gesto solidário de doar uma pequena quantidade do próprio sangue para salvar a vida de pessoas que se submetem a tratamentos e intervenções médicas de grande porte e complexidade, como transfusões, transplantes, procedimentos oncológicos e cirurgias. Além de pessoas que submetem a procedimentos e intervenções médicas, o sangue também é indispensável para que pacientes com doenças crônicas graves - como Doença Falciforme e Talassemia - possam viver por mais tempo e com mais qualidade, além de ser de vital importância para tratar feridos em situações de emergência ou calamidades.\n\n'

                        'Uma única doação pode salvar até quatro vidas. Um simples gesto de amor e solidariedade pode gerar muitos sorrisos. Faça sua parte, independentemente de parentesco entre o doador e quem receberá a doação. O sangue é insubstituível e sem ele é impossível viver. Por isso, o Ministério da Saúde reforça periodicamente a importância de os brasileiros adotarem a cultura solidária da doação regular e espontânea de sangue.\n\n'

                        'O objetivo é manter os estoques de sangue sempre abastecidos e não apenas em datas específicas ou quando algum conhecido precisar. Agora que você entende a importância deste ato de solidariedade, faça a sua parte. Vá ao hemocentro mais próximo e doe sangue regularmente. Vidas dependem de você!\n', 
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        )
                          ),
                        ],
                      ),
                    ),

                    Card(
                      margin: EdgeInsets.all(5),
                      child: ExpansionTile(                       
                      title: Text('Como doar sangue?', 
                        style: TextStyle(                          
                          fontSize: 18,
                        ),                        
                      ),
                      textColor: Colors.redAccent,
                      children: [
                        ListTile(title: Text('Para doar sangue, basta procurar as unidades de coleta de sangue, como os Hemocentros, para checar se você atende aos requisitos necessários para a doação. Existem impedimentos temporários e também impedimentos definitivos. No mais, basta estar imbuído pelo desejo de ajudar o próximo.\n', 
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        )
                          ),
                        ],
                      ),
                    ),

                    Card(
                      margin: EdgeInsets.all(5),
                      child: ExpansionTile(                       
                      title: Text('Qual a quantidade de sangue doado?', 
                        style: TextStyle(                          
                          fontSize: 18,
                        ),                        
                      ),
                      textColor: Colors.redAccent,
                      children: [
                        ListTile(title: Text('Uma pessoa adulta tem, em média, 5 litros de sangue. Em cada doação, o máximo de sangue retirado é de 450 ml.\n', 
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        )
                          ),
                        ],
                      ),
                    ),

                    Card(
                      margin: EdgeInsets.all(5),
                      child: ExpansionTile(                       
                      title: Text('Quanto tempo devo esperar entre uma doação e outra?', 
                        style: TextStyle(                          
                          fontSize: 18,
                        ),                        
                      ),
                      textColor: Colors.redAccent,
                      children: [
                        ListTile(title: Text('Para homens, o período entre uma doação e outra é de 2 meses, realizando, no máximo, 4 doações ao ano. ' 
                        'Já para as mulheres, o intervalo entre as doações é de 3 meses, podendo realizar, no máximo, 3 doações anuais.\n', 
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        )
                          ),
                        ],
                      ),
                    ),

                    Card(
                     margin: EdgeInsets.all(5),
                      child: ExpansionTile(                       
                      title: Text('Quais são os requisitos para doação de sangue?', 
                        style: TextStyle(                          
                          fontSize: 18,
                        ),                        
                      ),
                      textColor: Colors.redAccent,
                      children: [
                        ListTile(title: Text('Podem doar sangue pessoas entre 16 e 69 anos e que estejam pesando mais de 50kg. Além disso, é preciso apresentar documento oficial com foto e menores de 18 anos só podem doar com consentimento formal dos responsáveis. Pessoas com febre, gripe ou resfriado, diarreia recente, grávidas e mulheres no pós-parto não podem doar temporariamente.\n', 
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        )
                          ),
                        ],
                      ),
                    ),

                    Card(
                      margin: EdgeInsets.all(5),
                      child: ExpansionTile(                       
                      title: Text('Quais são os impedimentos definitivos para doar sangue?', 
                        style: TextStyle(                          
                          fontSize: 18,
                        ),                        
                      ),
                      textColor: Colors.redAccent,
                      children: [
                        ListTile(title: Text('Ter passado por um quadro de hepatite após os 11 anos de idade;\n\n'
                          'Evidência clínica ou laboratorial das seguintes doenças transmissíveis pelo sangue: Hepatites B e C, AIDS (vírus HIV), doenças associadas ao vírus HTLV I e II e Doenças de Chagas;\n\n' 
                          'Uso de drogas ilícitas injetáveis;\n\n'
                          'Malária.\n', 
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        )
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  }
}