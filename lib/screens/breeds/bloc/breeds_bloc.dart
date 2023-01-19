import 'package:arch_sample/data/model/breed_model.dart';
import 'package:arch_sample/screens/breeds/breeds_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'breeds_event.dart';

part 'breeds_state.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  final BreedsUseCase _useCase;

  BreedsBloc(this._useCase) : super(InitialState()) {
    on<BreedsEvent>((event, emit) async {
      emit(LoadingHome());
      try {
        final results = await _useCase.execute();
        results?.fold((failure) => emit(ErrorHome(failure)),
            (success) => LoadedHome(fetchedDogs: success.breedList));
      } catch (e) {
        emit(ErrorHome(e));
      }
    });
  }
}
