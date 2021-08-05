import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String email = '';
  String password = '';

  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic));

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // adicionando uma logo através da internet
              Container(
                width: 250,
                height: 250,
                // precisa declarar no pubspec o caminho da imagem
                child: Image.asset('assets/images/logo2.png'),
              ),
              // espaçamento de 15
              Container(height: 15),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 20, bottom: 12),
                  child: Column(
                    children: [
                      TextField(
                        // escutar o que ele escreve
                        onChanged: (text) {
                          email = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        // escutar o que ele escreve
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      // Dando espaço entre o TextField (input password) e Botão
                      SizedBox(height: 15),
                      ElevatedButton(
                        style: style,
                        onPressed: () {
                          if (email == 'will@will.com' && password == '2468') {
                            // Criando rota de forma 'automatica'. Ver app_widget.
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            _onFail();
                          }
                        },
                        child: Container(
                            width: double.infinity,
                            child: Text(
                              'LOGIN',
                              textAlign: TextAlign.center,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Stack: empilhando
      body: Stack(
        children: [
          // Adicionando tamanho da imagem e esticando ela com BoxFit.cover
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Background da imagem um pouco escuro
          Container(color: Colors.black.withOpacity(0.3)),
          _body(),
        ],
      ),
    );
  }

  void _onFail() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Falha ao Entrar!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'X',
        onPressed: () {},
      ),
    ));
  }
}
