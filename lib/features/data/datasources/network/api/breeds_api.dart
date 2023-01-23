import 'package:arch_sample/features/data/model/breeds_model.dart';
import 'package:arch_sample/features/data/datasources/network/networks_models/request.dart';
import 'package:arch_sample/features/data/datasources/network/networks_models/response.dart';
import 'package:arch_sample/features/data/datasources/network/network_service.dart';

abstract class BreedsApi {
  factory BreedsApi(NetworkService networkService) = _BreedsApiImpl;

  Future<NetworkResponse<BreedsModel>> getBreeds();

  static const String baseUrl = "https://dog.ceo";
  static const String _apiPath = '/api';
  static const String _breedsPath = '$_apiPath/breeds/list/all';
}

class _BreedsApiImpl implements BreedsApi {
  _BreedsApiImpl(NetworkService networkService) : _networkService = networkService..baseUrl = BreedsApi.baseUrl;

  final NetworkService _networkService;

  @override
  Future<NetworkResponse<BreedsModel>> getBreeds() async => await _networkService.request(
        const NetworkRequest(
          method: NetworkRequestType.get,
          path: BreedsApi._breedsPath,
          data: null,
        ),
        (response) => BreedsModel.fromJson(response),
      );
}
