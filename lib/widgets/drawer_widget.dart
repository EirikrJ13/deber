import 'package:flutter/material.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:myapp/widgets/costoum_tile_widget.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      child: Container(
        width: size.width * 0.7,
        height: double.infinity,
        color: Colors.blueGrey[50],
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.blueGrey[800],
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.network(
                      'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745',
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Hello, User!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  CostoumTileWidget(
                    lead: Icons.home_outlined,
                    label: 'Home',
                    route: AppRoutes.home,
                  ),
                  const Divider(height: 1, thickness: 1, color: Colors.grey),
                  CostoumTileWidget(
                    lead: Icons.document_scanner_outlined,
                    label: 'List',
                    route: AppRoutes.productList,
                  ),
                  const Divider(height: 1, thickness: 1, color: Colors.grey),
                  CostoumTileWidget(
                    lead: Icons.add_outlined,
                    label: 'Create',
                    route: AppRoutes.creteUpdate,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
