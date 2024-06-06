import 'package:flutter/material.dart';

class ProductListWidget extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;

  const ProductListWidget({
    Key? key,
    required this.name,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Image.network(
                imageUrl,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
