part of 'breeds_bloc.dart';

@freezed
class BreedsEvent with _$BreedsEvent {
  const factory BreedsEvent.loaded() = LoadedEvent;
}
