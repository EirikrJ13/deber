import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/providers/product_provider.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:myapp/types/product.dart';


import '../widgets/drawer_widget.dart';

class CreateUpdateView extends ConsumerWidget {
  final String? productId;
  const CreateUpdateView({super.key, this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController nameCtrl = TextEditingController();
    final TextEditingController priceCtrl = TextEditingController();
    final TextEditingController stockCtrl = TextEditingController();
    final TextEditingController urlImageCtrl = TextEditingController();
    final TextEditingController descriptionCtrl = TextEditingController();

    final productIdProv = productId == null
        ? ref.watch(productEmptyProvider)
        : ref.watch(productByIdProvider(productId!));

    return Scaffold(
      appBar: AppBar(
        title: Text(productId == null ? "Create Product" : "Update Product"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  productIdProv.when(
                      data: (product) {
                        if(productId != null){
                          // Update inputs controllers
                          nameCtrl.text = product.name;
                          priceCtrl.text = product.price.toString();
                          stockCtrl.text = product.stock.toString();
                          urlImageCtrl.text = product.urlImage;
                          descriptionCtrl.text = product.description;
                        }
                        return Column(
                          children: [
                            _buildTextField(
                              icon: Icons.drive_file_rename_outline,
                              hintText: 'Product Name',
                              controller: nameCtrl,
                            ),
                            _buildTextField(
                              icon: Icons.attach_money,
                              hintText: 'Price',
                              controller: priceCtrl,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            ),
                            _buildTextField(
                              icon: Icons.storage,
                              hintText: 'Stock',
                              controller: stockCtrl,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            ),
                            _buildTextField(
                              icon: Icons.image,
                              hintText: 'Image URL',
                              controller: urlImageCtrl,
                            ),
                            _buildTextField(
                              icon: Icons.description,
                              hintText: 'Description',
                              controller: descriptionCtrl,
                            ),
                          ],
                        );
                      },
                      error: (err, trc) {
                        return Column(
                          children: [Text('$err'), Text('$trc')],
                        );
                      },
                      loading: () => const Center(child: CircularProgressIndicator())),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple, // Background color
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          padding: const EdgeInsets.symmetric(vertical: 16.0)),
                      onPressed: () async {
                        final Product productSubmit = Product(
                            id: productId ?? '',
                            name: nameCtrl.text,
                            price: double.parse(priceCtrl.text),
                            stock: double.parse(stockCtrl.text),
                            urlImage: urlImageCtrl.text,
                            description: descriptionCtrl.text,
                            v: 0);

                        if(productId == null){
                          // Crear
                          ref.read(createProductProvider(productSubmit));
                        } else {
                          // Actualizar
                          ref.read(updateProductProvider(productSubmit));
                        }

                        context.push(AppRoutes.productList);
                        ref.invalidate(productsProvider);
                      },
                      child: Text(
                        productId == null ? 'Create' : 'Update',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String hintText,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.deepPurple),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.deepPurple),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        ),
      ),
    );
  }
}
