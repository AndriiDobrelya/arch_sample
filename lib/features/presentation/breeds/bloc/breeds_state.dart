part of 'breeds_bloc.dart';

@freezed
class BreedsState with _$BreedsState {
  const factory BreedsState.initial() = _InitialState;

  const factory BreedsState.loading() = _LoadingState;

  const factory BreedsState.loaded({required List<BreedInfo> fetchedDogs}) = _LoadedState;

  const factory BreedsState.showInfo({required BreedInfo breedInfo}) = _ShowInfo;

  const factory BreedsState.error({final Object? exception}) = _ErrorState;
}
