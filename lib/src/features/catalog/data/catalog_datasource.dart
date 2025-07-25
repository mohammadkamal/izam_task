part of '../catalog.dart';

// Additional sub-layer to handle errors from json parsing
class CatalogDatasource {
  Future<List<Map<String, dynamic>>> getCatalogItems() async {
    try {
      final file = await rootBundle.loadString('assets/catalog.json');
      final List<dynamic> jsonData = json.decode(file) as List<dynamic>;
      return jsonData.map((item) => item as Map<String, dynamic>).toList();
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }
}
