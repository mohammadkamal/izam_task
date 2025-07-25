part of '../../catalog.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: [
          IconButton(
            onPressed: () => context.pushNamed(AppRoute.cart.name),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: BlocProvider<CatalogController>(
        create: (_) => Injector.instance()..fetchCatalogItems(),
        child: const _CatalogViewBuilder(),
      ),
    );
  }
}

class _CatalogViewBuilder extends StatelessWidget {
  const _CatalogViewBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogController, BaseListControllerState<CatalogItem>>(
      builder: (_, state) {
        if (state.status == CubitStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == CubitStatus.failure) {
          return Center(child: Text(state.errorMessage ?? 'An error occurred'));
        } else if (state.items.isEmpty) {
          return const Center(child: Text('No items found'));
        }

        return ListView.builder(
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            final item = state.items[index];
            return CatalogItemBuilder(item: item);
          },
        );
      },
    );
  }
}
