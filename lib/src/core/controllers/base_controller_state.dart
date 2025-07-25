import 'package:dart_mappable/dart_mappable.dart';
import 'package:izam_task/src/core/controllers/cubit_status.dart';

part 'base_controller_state.mapper.dart';

@MappableClass()
class BaseListControllerState<T> with BaseListControllerStateMappable<T> {
  const BaseListControllerState({
    this.status = CubitStatus.initial,
    this.items = const [],
    this.errorMessage,
  });

  final CubitStatus status;
  final List<T> items;
  final String? errorMessage;

  bool get isLoading => status == CubitStatus.loading;
  bool get hasValue => status == CubitStatus.success;
  bool get hasError => status == CubitStatus.failure;
  bool get updatingUI => status == CubitStatus.updateUI;
}
