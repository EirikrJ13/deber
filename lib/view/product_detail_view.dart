import 'package:flutter/material.dart';
import 'package:myapp/widgets/drawer_widget.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Detail View"),),
      drawer: const DrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              'https://img.remediosdigitales.com/f7c94d/lamborghini_revuelto_6/840_560.jpeg',
               width: 290,
              height: 200,
            ),
            SizedBox(height: 20),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'El Lamborghini Revuelto es un superdeportivo de última generación con un diseño audaz y tecnología de punta. Este modelo combina rendimiento y lujo, ofreciendo una experiencia de conducción inigualable.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Accion
              },
              child: Text('Más información'),
            ),
          ],
        ),
      ),
    );
  }
}