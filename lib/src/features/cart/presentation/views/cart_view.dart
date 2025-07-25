part of '../../cart.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CartController>().clearCart();
            },
            icon: Icon(Icons.delete_outline),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => ReceiptSheet(),
              );
            },
            icon: Icon(Icons.receipt),
          ),
        ],
      ),
      body: const _CartViewBuilder(),
    );
  }
}

class _CartViewBuilder extends StatelessWidget {
  const _CartViewBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartController, BaseListControllerState<CartItem>>(
      builder: (_, state) {
        if (state.status == CubitStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == CubitStatus.failure) {
          return Center(child: Text(state.errorMessage ?? 'An error occurred'));
        } else if (state.items.isEmpty) {
          return const Center(child: Text('No items in cart'));
        }

        return ListView.builder(
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            final item = state.items[index];
            return ListTile(
              title: Text(item.item.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CartController>().decrementQuantity(
                        item.item.id,
                      );
                    },
                    icon:
                        item.quantity <= 1
                            ? Icon(Icons.delete)
                            : Icon(Icons.remove),
                  ),
                  Text(item.quantity.toString()),
                  IconButton(
                    onPressed: () {
                      context.read<CartController>().incrementQuantity(
                        item.item.id,
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
