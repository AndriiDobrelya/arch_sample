import 'package:arch_sample/dependencies.dart';

import 'package:arch_sample/features/domain/usecases/breeds_use_case.dart';
import 'package:arch_sample/features/presentation/breeds/bloc/breeds_bloc.dart';
import 'package:arch_sample/features/presentation/breeds/breeds_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedsScreen extends StatelessWidget {
  const BreedsScreen({super.key});

  static const path = '/';


  @override
  Widget build(BuildContext context) {
    return BlocProvider<BreedsBloc>(
      create: (_) => BreedsBloc(getIt<BreedsUseCase>()),
      child: const BreedsLayout(),
    );
  }
}
