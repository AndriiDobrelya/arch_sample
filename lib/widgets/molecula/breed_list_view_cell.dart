import 'package:arch_sample/features/domain/entities/breed_info.dart';
import 'package:arch_sample/features/presentation/breeds/bloc/breeds_bloc.dart';
import 'package:arch_sample/generated/assets/assets.gen.dart';
import 'package:arch_sample/generated/assets/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedListViewCellWidget extends StatelessWidget {
  const BreedListViewCellWidget({super.key, required this.breed});

  final BreedInfo breed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          children: [
            Assets.images.icons.dogIcon.svg(width: 15, height: 15),
            const SizedBox(
              width: 15,
            ),
            Text(
              breed.nameFormatter,
              style: const TextStyle(fontFamily: FontFamily.roboto),
            )
          ],
        ),
        onTap: () => context.read<BreedsBloc>().add(BreedsEvent.showInfo(breedInfo: breed)),
      ),
    );
  }
}
