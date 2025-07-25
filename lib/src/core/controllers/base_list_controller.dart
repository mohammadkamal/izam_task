import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:izam_task/src/core/controllers/base_controller_state.dart';

abstract class BaseListController<T>
    extends HydratedCubit<BaseListControllerState<T>> {
  BaseListController() : super(BaseListControllerState<T>());
}
