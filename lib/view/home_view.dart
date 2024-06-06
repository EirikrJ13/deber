import 'package:flutter/material.dart';
import 'package:myapp/widgets/drawer_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home View"),),
      drawer: const DrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn.autobild.es/sites/navi.axelspringer.es/public/media/image/2017/05/635741-este-lamborghini-350-gt-pertenecio-ferruccio-lamborghini.jpg',
              width: 290,
              height: 200,
            ),
            SizedBox(height: 1), 
            Text(
              'Valiente, Auténtico e Inesperado.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Compras un Lamborghini cuando eres alguien.',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 15, 19, 219),
              ),
            ),
          ],
        ),
      ),
    );
  }
}