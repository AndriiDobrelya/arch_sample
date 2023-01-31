import 'package:arch_sample/features/domain/entities/breed_info.dart';
import 'package:arch_sample/features/presentation/breeds/bloc/breeds_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedListViewCellWidget extends StatelessWidget {
  const BreedListViewCellWidget({super.key, required this.breed});

  final BreedInfo breed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(breed.nameFormatter),
        onTap: () => context.read<BreedsBloc>().add(BreedsEvent.showInfo(breedInfo: breed)),
      ),
    );
  }
}
