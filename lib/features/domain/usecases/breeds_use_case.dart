import 'package:arch_sample/core/use_case.dart';
import 'package:arch_sample/features/data/datasources/network/api/result.dart';
import 'package:arch_sample/features/domain/entities/breeds.dart';
import 'package:arch_sample/features/domain/repositories/breeds_repository.dart';

class BreedsUseCase implements UseCase<Result<Breeds>, NoParams> {
  final BreedsRepository repository;

  BreedsUseCase(this.repository);

  @override
  Future<Result<Breeds>> execute(NoParams noParams) async => await repository.fetchBreeds();
}
