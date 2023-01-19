import 'package:arch_sample/data/model/breeds.dart';
import 'package:arch_sample/data/network/network_errors.dart';
import 'package:arch_sample/data/repositories/breeds_repository.dart';
import 'package:dartz/dartz.dart';

class BreedsUseCase {
  final BreedsRepository repository;

  BreedsUseCase(this.repository);

  Future<Either<NetworkError, Breeds>?> execute() async => await repository.fetchBreeds();
}
