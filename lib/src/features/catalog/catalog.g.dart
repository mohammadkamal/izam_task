// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogItem _$CatalogItemFromJson(Map<String, dynamic> json) => CatalogItem(
  id: json['id'] as String,
  name: json['name'] as String? ?? '',
  price: (json['price'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$CatalogItemToJson(CatalogItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
