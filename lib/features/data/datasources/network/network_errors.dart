import 'package:arch_sample/core/failures.dart';

class NetworkError extends Failure {
  NetworkError({required dynamic error, this.baseUrl, this.path, this.statusCode}) : super(error);
  final String? baseUrl;
  final String? path;
  final int? statusCode;

  @override
  String toString() => 'NetworkError{error: $error, baseUrl: $baseUrl, path: $path, statusCode: $statusCode}';
}

class ConnectionError extends NetworkError {
  ConnectionError({required super.error});
}

class UnauthorizedError extends NetworkError {
  UnauthorizedError({required super.error});
}

class UnexpectedError extends NetworkError {
  UnexpectedError({required super.error});
}
