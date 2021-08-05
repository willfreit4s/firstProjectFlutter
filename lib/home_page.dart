import 'package:flutter/material.dart';
import 'package:hello_world/app_controller.dart';

// Pede sempre um estado. Posso alterar algumas coisas no App
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

// criei uma classe que extende State para usar na função acima
class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menu hamburguer
      drawer: Drawer(
        child: Column(
          children: [
            // Informações (imagem, nome e e-mail) 'cabeçalho'
            UserAccountsDrawerHeader(
                // Deixando imagem redonda com ClipRRect. Também é possível usar o ClipOval, caso use, basta comentar a linha 27
                currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset('assets/images/willian.jpg')),
                accountName: Text('Willian Freitas'),
                accountEmail: Text('willianf@wize.com')),
            // Lista de opções com título e subtítulos
            ListTile(
              // adicionando um ícone à esquerda
              leading: Icon(Icons.home),
              title: Text('Home'),
              subtitle: Text('tela de início'),
              // Evento ao clicar
              onTap: () {
                print('home');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              subtitle: Text('Encerrar Sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          CustomSwitcher(),
        ],
      ),
      body: Container(
        // definindo tamanho da minha Coluna
        width: double.infinity,
        height: double.infinity,
        child: Column(
          // Centralizando item da coluna
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador: $counter'),
            Container(height: 10),
            CustomSwitcher(),
            // espaçamento de 50 na altura
            Container(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}

// Componentização do tema dark e ligth
class CustomSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
