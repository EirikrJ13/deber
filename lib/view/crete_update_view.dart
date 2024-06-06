import 'package:flutter/material.dart';
import 'package:myapp/widgets/drawer_widget.dart';

class CreteUpdateView extends StatelessWidget {
  const CreteUpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create-Update"),
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Stock',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'URL/Img',
                ),
                keyboardType: TextInputType.url,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                keyboardType: TextInputType.text,
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Acción 
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
