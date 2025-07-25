import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:izam_task/src/features/cart/cart.dart';
import 'package:izam_task/src/features/catalog/catalog.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // Use a temporary directory for HydratedStorage in tests
    final directory = Directory.systemTemp.createTempSync();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(directory.path),
    );
  });

  group('CartController', () {
    late CartController controller;
    final testCatalogItem = CatalogItem(
      id: '1',
      name: 'Test Item',
      price: 10.0,
    );

    setUp(() {
      controller = CartController();
    });

    test('addToCart adds an item', () {
      controller.addToCart(testCatalogItem);
      expect(controller.state.items.length, 1);
      expect(controller.state.items.first.item.id, '1');
      expect(controller.state.items.first.quantity, 1);
    });

    test('removeFromCart removes an item', () {
      controller.addToCart(testCatalogItem);
      controller.removeFromCart('1');
      expect(controller.state.items.isEmpty, true);
    });

    test('incrementQuantity increases quantity', () {
      controller.addToCart(testCatalogItem);
      controller.incrementQuantity('1');
      expect(controller.state.items.first.quantity, 2);
    });

    test('decrementQuantity decreases quantity', () {
      controller.addToCart(testCatalogItem);
      controller.incrementQuantity('1');
      controller.decrementQuantity('1');
      expect(
        controller.state.items.firstWhere((i) => i.item.id == '1').quantity,
        1,
      );
    });

    test('decrementQuantity removes item if quantity is 1', () {
      controller.addToCart(testCatalogItem);
      controller.decrementQuantity('1');
      expect(controller.state.items.isEmpty, true);
    });

    test('clearCart removes all items', () {
      controller.addToCart(testCatalogItem);
      controller.clearCart();
      expect(controller.state.items.isEmpty, true);
    });

    test('toJson and fromJson work correctly', () {
      controller.addToCart(testCatalogItem);
      final json = controller.toJson(controller.state);
      final restored = controller.fromJson(json!);
      expect(restored!.items.length, 1);
      expect(restored.items.first.item.id, '1');
    });
  });
}
