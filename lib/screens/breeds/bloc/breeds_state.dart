part of 'breeds_bloc.dart';

@immutable
abstract class BreedsState {}

class InitialState extends BreedsState {}

class LoadingHome extends BreedsState {}

class LoadedHome extends BreedsState {
  final List<BreedModel> fetchedDogs;

  LoadedHome({required this.fetchedDogs});
}

class ErrorHome extends BreedsState {
  final Object exception;

  ErrorHome(this.exception);
}
