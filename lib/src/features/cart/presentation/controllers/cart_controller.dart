part of '../../cart.dart';

class CartController extends BaseListController<CartItem> {
  void addToCart(CatalogItem item) {
    final currentState = state;
    final updatedItems = List<CartItem>.from(currentState.items)
      ..add(CartItem(item: item, quantity: 1));

    emit(
      BaseListControllerState<CartItem>(
        items: updatedItems,
        status: CubitStatus.updateUI,
      ),
    );
  }

  void removeFromCart(String id) {
    final currentState = state;
    final updatedItems = List<CartItem>.from(currentState.items)
      ..removeWhere((i) => i.item.id == id);

    emit(
      BaseListControllerState<CartItem>(
        items: updatedItems,
        status: CubitStatus.updateUI,
      ),
    );
  }

  void incrementQuantity(String id) {
    final currentState = state;
    final item = currentState.items.firstWhereOrNull((i) => i.item.id == id);
    if (item == null) return;
    final index = currentState.items.indexWhere((i) => i.item.id == id);

    final updatedItems =
        List<CartItem>.from(currentState.items)
          ..removeAt(index)
          ..insert(
            index,
            CartItem(item: item.item, quantity: item.quantity + 1),
          );

    emit(
      BaseListControllerState<CartItem>(
        items: updatedItems,
        status: CubitStatus.updateUI,
      ),
    );
  }

  void decrementQuantity(String id) {
    final currentState = state;
    final item = currentState.items.firstWhereOrNull((i) => i.item.id == id);
    if (item == null) return;
    if (item.quantity <= 1) {
      removeFromCart(id);
      return;
    }

    final index = currentState.items.indexWhere((i) => i.item.id == id);

    final updatedItems =
        List<CartItem>.from(currentState.items)
          ..removeAt(index)
          ..insert(
            index,
            CartItem(item: item.item, quantity: item.quantity - 1),
          );

    emit(
      BaseListControllerState<CartItem>(
        items: updatedItems,
        status: CubitStatus.updateUI,
      ),
    );
  }

  void clearCart() {
    emit(
      BaseListControllerState<CartItem>(
        items: [],
        status: CubitStatus.updateUI,
      ),
    );
  }

  @override
  BaseListControllerState<CartItem>? fromJson(Map<String, dynamic> json) {
    return BaseListControllerState(
      items:
          List<Map<String, dynamic>>.from(
            json['items'],
          ).map(CartItem.fromJson).toList(),
      status: CubitStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => CubitStatus.initial,
      ),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  @override
  Map<String, dynamic>? toJson(BaseListControllerState<CartItem> state) {
    return {
      'items': state.items.map((item) => item.toJson()).toList(),
      'status': state.status.name,
      'errorMessage': state.errorMessage,
    };
  }
}
