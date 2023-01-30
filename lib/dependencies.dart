import 'package:arch_sample/features/data/datasources/network/network_service.dart';
import 'package:arch_sample/features/data/datasources/network/api/breeds_api.dart';
import 'package:arch_sample/features/data/repositories/breeds_repository.dart';
import 'package:arch_sample/features/domain/repositories/breeds_repository.dart';
import 'package:arch_sample/features/domain/usecases/breeds_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  final NetworkService networkService = NetworkService();
  getIt
    ..registerSingleton(networkService)
    ..registerSingleton(BreedsApi(getIt<NetworkService>()))
    ..registerLazySingleton<BreedsRepository>(() => BreedsRepositoryImpl(getIt<BreedsApi>()))
    ..registerSingleton(BreedsUseCase(getIt<BreedsRepository>()));
}
