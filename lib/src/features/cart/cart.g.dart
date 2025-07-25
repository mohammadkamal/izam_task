// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
  item: CatalogItem.fromJson(json['item'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
  'item': instance.item.toJson(),
  'quantity': instance.quantity,
};
