import 'package:arch_sample/core/bloc.dart';
import 'package:arch_sample/core/failures.dart';
import 'package:arch_sample/core/use_case.dart';
import 'package:arch_sample/features/domain/entities/breed_info.dart';
import 'package:arch_sample/features/domain/usecases/breeds_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'breeds_event.dart';

part 'breeds_state.dart';

part 'breeds_bloc.freezed.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> with CommonErrorsHandler<BreedsEvent, BreedsState> {
  final BreedsUseCase _useCase;

  BreedsBloc(this._useCase) : super(const BreedsState.initial()) {
    on<BreedsEvent>((event, emit) async {
      emit(const BreedsState.loading());
      final results = await _useCase.execute(NoParams());
      results.when(
        success: (data) => emit(BreedsState.loaded(fetchedDogs: data.breedList)),
        error: (Failure error) => handleError(error),
      );
    });
  }
}
