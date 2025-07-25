part of '../../catalog.dart';

@JsonSerializable()
class CatalogItem {
  const CatalogItem({required this.id, this.name = '', this.price = 0});

  factory CatalogItem.fromJson(Map<String, dynamic> json) =>
      _$CatalogItemFromJson(json);

  final String id;
  final String name;
  final double price;

  Map<String, dynamic> toJson() => _$CatalogItemToJson(this);
}
