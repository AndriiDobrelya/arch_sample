import 'package:arch_sample/features/data/datasources/network/network_errors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';

@freezed
class NetworkResponse<T> with _$NetworkResponse<T> {
  const factory NetworkResponse.success(T data) = Success<T>;

  const factory NetworkResponse.failure(NetworkError error) = Failure;
}
