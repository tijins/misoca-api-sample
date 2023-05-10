// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkState<T> {
  NetworkStatus get status => throw _privateConstructorUsedError;
  T? get value => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkStateCopyWith<T, NetworkState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkStateCopyWith<T, $Res> {
  factory $NetworkStateCopyWith(
          NetworkState<T> value, $Res Function(NetworkState<T>) then) =
      _$NetworkStateCopyWithImpl<T, $Res, NetworkState<T>>;
  @useResult
  $Res call({NetworkStatus status, T? value, Exception? error});
}

/// @nodoc
class _$NetworkStateCopyWithImpl<T, $Res, $Val extends NetworkState<T>>
    implements $NetworkStateCopyWith<T, $Res> {
  _$NetworkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? value = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NetworkStatus,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NetworkStateCopyWith<T, $Res>
    implements $NetworkStateCopyWith<T, $Res> {
  factory _$$_NetworkStateCopyWith(
          _$_NetworkState<T> value, $Res Function(_$_NetworkState<T>) then) =
      __$$_NetworkStateCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({NetworkStatus status, T? value, Exception? error});
}

/// @nodoc
class __$$_NetworkStateCopyWithImpl<T, $Res>
    extends _$NetworkStateCopyWithImpl<T, $Res, _$_NetworkState<T>>
    implements _$$_NetworkStateCopyWith<T, $Res> {
  __$$_NetworkStateCopyWithImpl(
      _$_NetworkState<T> _value, $Res Function(_$_NetworkState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? value = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_NetworkState<T>(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NetworkStatus,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_NetworkState<T> implements _NetworkState<T> {
  const _$_NetworkState({required this.status, this.value, this.error});

  @override
  final NetworkStatus status;
  @override
  final T? value;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'NetworkState<$T>(status: $status, value: $value, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkState<T> &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(value), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkStateCopyWith<T, _$_NetworkState<T>> get copyWith =>
      __$$_NetworkStateCopyWithImpl<T, _$_NetworkState<T>>(this, _$identity);
}

abstract class _NetworkState<T> implements NetworkState<T> {
  const factory _NetworkState(
      {required final NetworkStatus status,
      final T? value,
      final Exception? error}) = _$_NetworkState<T>;

  @override
  NetworkStatus get status;
  @override
  T? get value;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkStateCopyWith<T, _$_NetworkState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
