part of '../catalog.dart';

class CatalogRepository {
  final CatalogDatasource _datasource;

  const CatalogRepository({required CatalogDatasource datasource})
    : _datasource = datasource;

  Future<List<CatalogItem>> fetchCatalogItems() async {
    try {
      final items = await _datasource.getCatalogItems();
      return List.from(items.map(CatalogItem.fromJson));
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }
}
