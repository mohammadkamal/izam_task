import 'package:go_router/go_router.dart';
import 'package:izam_task/src/core/router/routes.dart';
import 'package:izam_task/src/features/cart/cart.dart';
import 'package:izam_task/src/features/catalog/catalog.dart';

class AppRouter {
  GoRouter get router {
    return GoRouter(
      initialLocation: AppRoute.home.path,
      routes: [
        GoRoute(
          path: AppRoute.home.path,
          name: AppRoute.home.name,
          builder: (context, state) {
            return const CatalogView();
          },
        ),
        GoRoute(
          path: AppRoute.cart.path,
          name: AppRoute.cart.name,
          builder: (context, state) {
            return const CartView();
          },
        ),
      ],
    );
  }
}
