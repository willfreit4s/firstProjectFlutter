import 'package:flutter/material.dart';
import 'package:hello_world/app_controller.dart';
import 'package:hello_world/home_page.dart';
import 'login_page.dart';

// StatelessWidget: é imutável, não tem alteração, não tem animação. Vai ter nada que se altere, a não ser que o pai o reconstrua
// class AppWidget extends StatelessWidget {
//   final String title;

//   const AppWidget({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text(
//           title,
//           textDirection: TextDirection.ltr,
//           style: TextStyle(color: Colors.white, fontSize: 50.0),
//         ),
//       ),
//     );
//   }
// }

// Usar para coisas estáticas
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
              theme: ThemeData(
                  primarySwatch: Colors.red,
                  brightness: AppController.instance.isDartTheme
                      ? Brightness.light
                      : Brightness.dark),
              initialRoute: '/',
              routes: {
                '/': (context) => Loginpage(),
                '/home': (context) => HomePage(),
              });
        });
  }
}
