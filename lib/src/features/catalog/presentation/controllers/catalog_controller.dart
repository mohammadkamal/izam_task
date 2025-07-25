part of '../../catalog.dart';

class CatalogController extends BaseListController<CatalogItem> {
  CatalogController({CatalogRepository? catalogRepository})
    : _catalogRepository =
          catalogRepository ?? Injector.instance<CatalogRepository>(),
      super();

  final CatalogRepository _catalogRepository;

  Future<void> fetchCatalogItems() async {
    try {
      emit(state.copyWith(status: CubitStatus.loading));
      final items = await _catalogRepository.fetchCatalogItems();
      emit(state.copyWith(items: items, status: CubitStatus.success));
    } on AppException catch (e) {
      emit(
        state.copyWith(status: CubitStatus.failure, errorMessage: e.message),
      );
    } catch (e) {
      emit(
        state.copyWith(status: CubitStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  @override
  BaseListControllerState<CatalogItem>? fromJson(Map<String, dynamic> json) {
    return BaseListControllerState(
      items:
          List<Map<String, dynamic>>.from(
            json['items'],
          ).map(CatalogItem.fromJson).toList(),
      status: CubitStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => CubitStatus.initial,
      ),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  @override
  Map<String, dynamic>? toJson(BaseListControllerState<CatalogItem> state) {
    return {
      'items': state.items.map((e) => e.toJson()).toList(),
      'status': state.status.name,
      'errorMessage': state.errorMessage,
    };
  }
}
