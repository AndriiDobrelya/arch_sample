import 'package:arch_sample/data/api/breeds_api.dart';
import 'package:arch_sample/data/network/network_service.dart';
import 'package:arch_sample/data/repositories/breeds_repository.dart';
import 'package:arch_sample/screens/breeds/breeds_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  NetworkService networkService = NetworkService();
  getIt
    ..registerSingleton(networkService)
    ..registerSingleton(BreedsApi(getIt<NetworkService>()))
    ..registerSingleton(BreedsRepository(getIt<BreedsApi>()))
    ..registerSingleton(BreedsUseCase(getIt<BreedsRepository>()));
}
