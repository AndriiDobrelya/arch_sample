import 'package:arch_sample/features/domain/entities/breed_info.dart';
import 'package:arch_sample/features/presentation/breed_info/bloc/breed_info_cubit.dart';
import 'package:arch_sample/features/presentation/breed_info/breed_info_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedInfoPage extends StatelessWidget {
  const BreedInfoPage({required this.breedInfo, super.key});

  final BreedInfo breedInfo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BreedInfoCubit>(
      create: (_) => BreedInfoCubit(),
      child: BreedInfoLayout(
        breedInfo: breedInfo,
      ),
    );
  }
}
