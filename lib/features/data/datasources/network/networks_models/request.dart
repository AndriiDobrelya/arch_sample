enum NetworkRequestType { get, post, put, delete }

class NetworkRequest {
  const NetworkRequest({
    required this.method,
    required this.path,
    required this.data,
    this.queryParams,
    this.headers,
    this.extra,
    this.retry = false,
  });

  final NetworkRequestType method;
  final String path;
  final dynamic data;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headers;
  final Map<String, dynamic>? extra;
  final bool retry;
}
