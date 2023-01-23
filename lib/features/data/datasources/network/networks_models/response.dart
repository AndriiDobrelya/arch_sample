import 'package:arch_sample/features/data/datasources/network/network_errors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';

@freezed
class NetworkResponse<T> with _$NetworkResponse<T> {
  const factory NetworkResponse.success(T data) = Success<T>;

  const factory NetworkResponse.timeoutError(NetworkError error) = TimeoutError;

  const factory NetworkResponse.responseError(NetworkError error) = ResponseError; //400 //401 //403 //409 //500

  const factory NetworkResponse.unexpectedError(NetworkError error) = UnexpectedError; //Other

  const factory NetworkResponse.hostUnavailable() = HostUnavailable; //No connection
}
