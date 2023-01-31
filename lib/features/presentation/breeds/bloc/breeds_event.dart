part of 'breeds_bloc.dart';

@freezed
class BreedsEvent with _$BreedsEvent {
  const factory BreedsEvent.loaded() = LoadedEvent;
  const factory BreedsEvent.showInfo({required BreedInfo breedInfo}) = ShowInfoEvent;
}
