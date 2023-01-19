import 'package:arch_sample/data/model/breeds.dart';
import 'package:arch_sample/data/network/network_errors.dart';
import 'package:arch_sample/data/network/network_service.dart';
import 'package:dartz/dartz.dart';

abstract class BreedsApi {
  factory BreedsApi(NetworkService networkService) = _BreedsApiImpl;

  Future<Either<NetworkError, Breeds>?> getBreeds();

  static const String baseUrl = "https://dog.ceo";
  static const String _apiPath = '/api';
  static const String _breedsPath = '$_apiPath/breeds/list/all';
}

class _BreedsApiImpl implements BreedsApi {
  _BreedsApiImpl(NetworkService networkService)
      : _networkService = networkService..baseUrl = BreedsApi.baseUrl;

  final NetworkService _networkService;

  @override
  Future<Either<NetworkError, Breeds>?> getBreeds() async {
    return _networkService
        .getRequest<Either<NetworkError, Breeds>>(BreedsApi._breedsPath);
  }
}
