import 'dart:async';
import 'package:arch_sample/features/data/datasources/network/networks_models/request.dart';
import 'package:arch_sample/features/data/datasources/network/networks_models/response.dart';
import 'package:arch_sample/features/data/datasources/network/network_errors.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

typedef OnParse<T> = T Function(dynamic);

abstract class NetworkService {
  factory NetworkService({
    String baseUrl,
    int connectTimeout,
    int receiveTimeout,
    int sendTimeout,
    Iterable<Interceptor>? interceptors,
  }) = _NetworkServiceImpl;

  set baseUrl(String url);

  Future<NetworkResponse<T>> request<T>(
    NetworkRequest request,
    OnParse onParse, {
    ProgressCallback? onSentProgress,
    ProgressCallback? onReceiveProgress,
  });
}

class _NetworkServiceImpl implements NetworkService {
  _NetworkServiceImpl({
    String baseUrl = '',
    int connectTimeout = defaultTimeout,
    int receiveTimeout = defaultTimeout,
    int sendTimeout = defaultTimeout,
    Iterable<Interceptor>? interceptors,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: connectTimeout,
            receiveTimeout: receiveTimeout,
            sendTimeout: sendTimeout,
          ),
        )..interceptors.addAll([...?interceptors]) {
    _dio.interceptors.add(
      RetryInterceptor(dio: _dio, retryDelays: [for (int i = 1; i <= 3; i++) Duration(milliseconds: 500 * i)]),
    );
  }

  static const int defaultTimeout = 5000;

  final Dio _dio;

  @override
  set baseUrl(String url) {
    final baseUrl = _dio.options.baseUrl;
    _dio.options.baseUrl = baseUrl.isEmpty
        ? url
        : throw StateError('Base URL has been already set up to $baseUrl. You\'re trying to reset the value.');
  }

  @override
  Future<NetworkResponse<T>> request<T>(NetworkRequest request, OnParse onParse,
      {ProgressCallback? onSentProgress, ProgressCallback? onReceiveProgress}) async {
    final options = Options()
      ..method = request.method.name
      ..headers = request.headers ?? <String, dynamic>{}
      ..extra = request.extra ?? <String, dynamic>{}
      ..disableRetry = !request.retry;
    try {
      final response = await _dio.request(
        request.path,
        data: request.data,
        queryParameters: request.queryParams,
        options: options,
        onSendProgress: onReceiveProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return NetworkResponse.success(onParse(response.data));
    } on DioError catch (e) {
      return _parseError<T>(e);
    }
  }

  NetworkResponse<T> _parseError<T>(DioError error) {
    final cause = error.error;
    final baseUrl = error.requestOptions.baseUrl;
    final path = error.requestOptions.path;
    final response = error.response;
    final statusCode = response?.statusCode;
    final networkError = NetworkError(error: cause, baseUrl: baseUrl, path: path, statusCode: statusCode);
    if (error.type == DioErrorType.response) {
      return NetworkResponse.failure(networkError);
    } else if (error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      return NetworkResponse.failure(networkError);
    } else {
      return NetworkResponse.failure(networkError);
    }
  }
}
