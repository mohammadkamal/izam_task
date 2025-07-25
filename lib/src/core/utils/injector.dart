import 'package:get_it/get_it.dart';
import 'package:izam_task/src/core/router/router.dart';
import 'package:izam_task/src/features/cart/cart.dart';
import 'package:izam_task/src/features/catalog/catalog.dart';

mixin Injector {
  static final GetIt instance = GetIt.instance;

  static Future<void> init() async {
    instance
      ..registerSingleton<AppRouter>(AppRouter())
      ..registerSingleton<CatalogDatasource>(CatalogDatasource())
      ..registerSingleton<CatalogRepository>(
        CatalogRepository(datasource: instance()),
      )
      ..registerFactory<CatalogController>(() => CatalogController())
      ..registerFactory<CartController>(() => CartController());
  }
}
