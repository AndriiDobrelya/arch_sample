import 'package:arch_sample/data/api/breeds_api.dart';
import 'package:arch_sample/data/model/breeds.dart';
import 'package:arch_sample/data/network/network_errors.dart';
import 'package:dartz/dartz.dart';

abstract class BreedsRepository {
  factory BreedsRepository(BreedsApi api) = _BreedsRepositoryImpl;

  Future<Either<NetworkError, Breeds>?> fetchBreeds();
}

class _BreedsRepositoryImpl implements BreedsRepository {
  _BreedsRepositoryImpl(this.api);

  final BreedsApi api;

  @override
  Future<Either<NetworkError, Breeds>?> fetchBreeds() async => api.getBreeds();
}
