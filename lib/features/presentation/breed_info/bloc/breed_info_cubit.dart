import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'breed_info_state.dart';

class BreedInfoCubit extends Cubit<BreedInfoState> {
  BreedInfoCubit() : super(BreedInfoInitial());
}
