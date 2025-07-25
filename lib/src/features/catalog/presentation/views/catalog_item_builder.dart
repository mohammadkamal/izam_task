part of '../../catalog.dart';

class CatalogItemBuilder extends StatelessWidget {
  const CatalogItemBuilder({super.key, required this.item});

  final CatalogItem item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartController, BaseListControllerState<CartItem>>(
      builder: (_, state) {
        final existInCart =
            state.items.firstWhereOrNull((i) => i.item.id == item.id) != null;

        return ListTile(
          title: Text(item.name),
          subtitle: Text(item.price.toStringAsFixed(2)),
          trailing: IconButton(
            icon:
                existInCart
                    ? const Icon(Icons.remove_shopping_cart)
                    : const Icon(Icons.add_shopping_cart),
            onPressed: () {
              if (existInCart) {
                context.read<CartController>().removeFromCart(item.id);
              } else {
                context.read<CartController>().addToCart(item);
              }
            },
          ),
        );
      },
    );
  }
}
