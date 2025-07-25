part of '../../cart.dart';

class ReceiptSheet extends StatelessWidget {
  const ReceiptSheet({super.key});

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

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  return ListTile(
                    title: Text(item.item.name),
                    subtitle: Text('Quantity: ${item.quantity}'),
                    trailing: Text(
                      '\$${(item.item.price * item.quantity).toStringAsFixed(2)}',
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: \$${state.items.fold<double>(0, (sum, item) => sum + (item.item.price * item.quantity)).toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        );
      },
    );
  }
}
