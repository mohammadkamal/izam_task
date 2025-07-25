part of '../../cart.dart';

@JsonSerializable(explicitToJson: true)
class CartItem {
  const CartItem({required this.item, this.quantity = 0});

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  final CatalogItem item;
  final int quantity;

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
