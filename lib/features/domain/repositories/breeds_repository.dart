import 'package:arch_sample/features/data/datasources/network/api/result.dart';
import 'package:arch_sample/features/domain/entities/breeds.dart';

abstract class BreedsRepository {
  Future<Result<Breeds>> fetchBreeds();
}
