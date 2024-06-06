import 'package:flutter/material.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:myapp/widgets/costoum_tile_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor
      ),
      child: Column(
        children: [
          const SizedBox(height: 35),
          const Text("Menu"),
          CostoumTileWidget(lead: Icons.home_outlined, label: 'home', route: AppRoutes.home,),
          CostoumTileWidget(lead: Icons.document_scanner_outlined, label: 'list', route: AppRoutes.productList,),
          CostoumTileWidget(lead: Icons.find_in_page_outlined, label: 'detail', route: AppRoutes.productDetail,),
          CostoumTileWidget(lead: Icons.add_outlined, label: 'create', route: AppRoutes.creteUpdate,)
        ],
      ),
    );
  }
}