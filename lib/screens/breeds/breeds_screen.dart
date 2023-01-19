import 'package:arch_sample/dependencies.dart';
import 'package:arch_sample/screens/breeds/bloc/breeds_bloc.dart';
import 'package:arch_sample/screens/breeds/breeds_layout.dart';
import 'package:arch_sample/screens/breeds/breeds_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BreedsBloc>(
      create: (_) => BreedsBloc(getIt<BreedsUseCase>()),
      child: const BreedsLayout(),
    );
  }
}
