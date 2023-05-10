import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_state.freezed.dart';

enum NetworkStatus { idle, running, failed, success }

@freezed
class NetworkState<T> with _$NetworkState<T> {
  const factory NetworkState({required NetworkStatus status, T? value, Exception? error}) = _NetworkState;
}
