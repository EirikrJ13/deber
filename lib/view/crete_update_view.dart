import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/providers/product_provider.dart';
import 'package:myapp/types/product.dart';
import 'package:myapp/widgets/drawer_widget.dart';
import 'package:myapp/widgets/product_form_fields.dart';


class CreateUpdateView extends ConsumerStatefulWidget {
  final String? productId;


  const CreateUpdateView({Key? key, this.productId}) : super(key: key);
  @override
  ConsumerState<CreateUpdateView> createState() => _CreateUpdateViewState();
}

class _CreateUpdateViewState extends ConsumerState<CreateUpdateView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _urlImageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.productId != null) {
      _loadProductData(widget.productId!);
    }
  }

  Future<void> _loadProductData(String productId) async {
    try {
      final product = await ref.read(productByIdProvider(productId).future);
      setState(() {
        _nameController.text = product.name;
        _stockController.text = product.stock.toString();
        _priceController.text = product.price.toString();
        _urlImageController.text = product.urlImage;
        _descriptionController.text = product.description;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to load product data: $e'),
      ));
    }
  }

  Future<void> _createOrUpdateProduct() async {
    try {
      final String name = _nameController.text;
      final double stock = double.parse(_stockController.text);
      final double price = double.parse(_priceController.text);
      final String urlImage = _urlImageController.text;
      final String description = _descriptionController.text;

      final product = Product(
        id: widget.productId ?? '',
        name: name,
        stock: stock,
        price: price,
        urlImage: urlImage,
        description: description,
        v: 0,
      );

       if (widget.productId == null) {
        final createProduct = ref.read(createProductProvider);
        await createProduct(product);
      } else {
        final updateProduct = ref.read(updateProductProvider);
        await updateProduct(product);
      }

      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to create or update product: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Create/Update'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:  <Widget>[
            ProductFormFields(
              nameController: _nameController,
              stockController: _stockController,
              priceController: _priceController,
              urlImageController: _urlImageController,
              descriptionController: _descriptionController,
            ),
            ElevatedButton(
              onPressed: _createOrUpdateProduct,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
