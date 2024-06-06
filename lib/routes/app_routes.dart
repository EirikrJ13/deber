import 'package:go_router/go_router.dart';
import 'package:myapp/view/index.dart';

class AppRoutes {
  static String home = "/";
  static String creteUpdate = "/crete-update";
  static String productDetail = "/product-detail";
  static String productList = "/product-list";
}

final routesConfig = GoRouter(routes: [
  GoRoute(path: AppRoutes.home,
  builder: (context, state) => const HomeView(), 
  ),
  GoRoute(path: AppRoutes.creteUpdate,
  builder: (context, state) => const CreteUpdateView(), 
  ),
  GoRoute(path: AppRoutes.productList,
  builder: (context, state) => const ProductListView()
  ), 
  GoRoute(path: AppRoutes.productDetail,
  builder: (context, state) => const ProductDetailView(), 
  ),
]);