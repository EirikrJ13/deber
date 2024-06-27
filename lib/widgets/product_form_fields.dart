import 'package:flutter/material.dart';

class ProductFormFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController stockController;
  final TextEditingController priceController;
  final TextEditingController urlImageController;
  final TextEditingController descriptionController;

  const ProductFormFields({
    Key? key,
    required this.nameController,
    required this.stockController,
    required this.priceController,
    required this.urlImageController,
    required this.descriptionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        TextFormField(
          controller: stockController,
          decoration: const InputDecoration(labelText: 'Stock'),
          keyboardType: TextInputType.number,
        ),
        TextFormField(
          controller: priceController,
          decoration: const InputDecoration(labelText: 'Price'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        TextFormField(
          controller: urlImageController,
          decoration: const InputDecoration(labelText: 'URL Image'),
        ),
        TextFormField(
          controller: descriptionController,
          decoration: const InputDecoration(labelText: 'Description'),
          maxLines: 3,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
