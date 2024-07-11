import 'package:go_router/go_router.dart';
import 'package:myapp/view/index.dart';

class AppRoutes {
  static String home = "/";
  static String creteUpdate = "/crete-update";
  static String productDetail= "/product-detail-view";
  static String productList = "/product-list";
}

final routesConfig = GoRouter(routes: [
  GoRoute(path: AppRoutes.home,
  builder: (context, state) => const HomeView(), 
  ),
  GoRoute(path: AppRoutes.creteUpdate,
  builder: (context, state) {
        final productId = state.uri.queryParameters['productId'];
        return CreateUpdateView(productId: productId);
      },
  ),
  GoRoute(path: AppRoutes.productList,
  builder: (context, state) => const ProductsListView()
  ), 
  GoRoute(
    //path: AppRoutes.productDetail,
   path: '${AppRoutes.productDetail}/:productId', 
   builder: (context, state) => ProductDetailView(
    productId: state.pathParameters['productId'],
   ), 
    // Suggested code may be subject to a license. Learn more: ~LicenseLog:3517544961. 
  ),
]);