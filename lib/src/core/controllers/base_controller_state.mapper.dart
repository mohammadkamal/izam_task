// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'base_controller_state.dart';

class BaseListControllerStateMapper
    extends ClassMapperBase<BaseListControllerState> {
  BaseListControllerStateMapper._();

  static BaseListControllerStateMapper? _instance;
  static BaseListControllerStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = BaseListControllerStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BaseListControllerState';
  @override
  Function get typeFactory => <T>(f) => f<BaseListControllerState<T>>();

  static CubitStatus _$status(BaseListControllerState v) => v.status;
  static const Field<BaseListControllerState, CubitStatus> _f$status =
      Field('status', _$status, opt: true, def: CubitStatus.initial);
  static List<dynamic> _$items(BaseListControllerState v) => v.items;
  static dynamic _arg$items<T>(f) => f<List<T>>();
  static const Field<BaseListControllerState, List<dynamic>> _f$items =
      Field('items', _$items, opt: true, def: const [], arg: _arg$items);
  static String? _$errorMessage(BaseListControllerState v) => v.errorMessage;
  static const Field<BaseListControllerState, String> _f$errorMessage =
      Field('errorMessage', _$errorMessage, opt: true);

  @override
  final MappableFields<BaseListControllerState> fields = const {
    #status: _f$status,
    #items: _f$items,
    #errorMessage: _f$errorMessage,
  };

  static BaseListControllerState<T> _instantiate<T>(DecodingData data) {
    return BaseListControllerState(
        status: data.dec(_f$status),
        items: data.dec(_f$items),
        errorMessage: data.dec(_f$errorMessage));
  }

  @override
  final Function instantiate = _instantiate;

  static BaseListControllerState<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BaseListControllerState<T>>(map);
  }

  static BaseListControllerState<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<BaseListControllerState<T>>(json);
  }
}

mixin BaseListControllerStateMappable<T> {
  String toJson() {
    return BaseListControllerStateMapper.ensureInitialized()
        .encodeJson<BaseListControllerState<T>>(
            this as BaseListControllerState<T>);
  }

  Map<String, dynamic> toMap() {
    return BaseListControllerStateMapper.ensureInitialized()
        .encodeMap<BaseListControllerState<T>>(
            this as BaseListControllerState<T>);
  }

  BaseListControllerStateCopyWith<BaseListControllerState<T>,
          BaseListControllerState<T>, BaseListControllerState<T>, T>
      get copyWith => _BaseListControllerStateCopyWithImpl<
          BaseListControllerState<T>,
          BaseListControllerState<T>,
          T>(this as BaseListControllerState<T>, $identity, $identity);
  @override
  String toString() {
    return BaseListControllerStateMapper.ensureInitialized()
        .stringifyValue(this as BaseListControllerState<T>);
  }

  @override
  bool operator ==(Object other) {
    return BaseListControllerStateMapper.ensureInitialized()
        .equalsValue(this as BaseListControllerState<T>, other);
  }

  @override
  int get hashCode {
    return BaseListControllerStateMapper.ensureInitialized()
        .hashValue(this as BaseListControllerState<T>);
  }
}

extension BaseListControllerStateValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, BaseListControllerState<T>, $Out> {
  BaseListControllerStateCopyWith<$R, BaseListControllerState<T>, $Out, T>
      get $asBaseListControllerState => $base.as((v, t, t2) =>
          _BaseListControllerStateCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class BaseListControllerStateCopyWith<
    $R,
    $In extends BaseListControllerState<T>,
    $Out,
    T> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items;
  $R call({CubitStatus? status, List<T>? items, String? errorMessage});
  BaseListControllerStateCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BaseListControllerStateCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, BaseListControllerState<T>, $Out>
    implements
        BaseListControllerStateCopyWith<$R, BaseListControllerState<T>, $Out,
            T> {
  _BaseListControllerStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BaseListControllerState> $mapper =
      BaseListControllerStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items => ListCopyWith(
      $value.items,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(items: v));
  @override
  $R call(
          {CubitStatus? status,
          List<T>? items,
          Object? errorMessage = $none}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (items != null) #items: items,
        if (errorMessage != $none) #errorMessage: errorMessage
      }));
  @override
  BaseListControllerState<T> $make(CopyWithData data) =>
      BaseListControllerState(
          status: data.get(#status, or: $value.status),
          items: data.get(#items, or: $value.items),
          errorMessage: data.get(#errorMessage, or: $value.errorMessage));

  @override
  BaseListControllerStateCopyWith<$R2, BaseListControllerState<T>, $Out2, T>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _BaseListControllerStateCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}
