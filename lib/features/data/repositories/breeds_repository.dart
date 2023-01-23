import 'package:arch_sample/features/data/datasources/network/api/result.dart';
import 'package:arch_sample/features/data/datasources/network/api/breeds_api.dart';
import 'package:arch_sample/features/data/datasources/network/network_errors.dart';
import 'package:arch_sample/features/data/model/breeds_model.dart';
import 'package:arch_sample/features/domain/entities/breeds.dart';
import 'package:arch_sample/features/domain/repositories/breeds_repository.dart';

class BreedsRepositoryImpl implements BreedsRepository {
  BreedsRepositoryImpl(this.api);

  final BreedsApi api;

  @override
  Future<Result<Breeds>> fetchBreeds() async {
    final result = await api.getBreeds();
    return result.when(
      success: (data) => Result<BreedsModel>.success(data),
      responseError: (error) => Result.error(error),
      timeoutError: (error) => Result.error(error),
      unexpectedError: (error) => Result.error(error),
      hostUnavailable: () => Result.error(NetworkError(error: 'Host Unavailable')),
    );
  }
}
