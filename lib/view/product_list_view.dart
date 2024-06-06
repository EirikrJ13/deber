import 'package:flutter/material.dart';
import 'package:myapp/widgets/drawer_widget.dart';
import 'package:myapp/widgets/product_list_widget.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'name': 'Lamborghini Huracán',
        'description': 'El Lamborghini Huracán es el acuerdo ideal entre tecnología y diseño. La primera emoción se siente con solo mirarlo. Líneas definidas y aerodinámicas diseñadas para contrarrestar el aire y domar la carretera.',
        'imageUrl': 'https://www.digitaltrends.com/wp-content/uploads/2019/01/lamborghini_huracan_evo_street_2.jpg?resize=625%2C417&p=1',
      },
      // Agregar más:
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List View"),
      ),
      drawer: const DrawerWidget(),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductListWidget(
            name: product['name']!,
            description: product['description']!,
            imageUrl: product['imageUrl']!,
          );
        },
      ),
    );
  }
}
