import 'package:arch_sample/configs/routes.gr.dart';
import 'package:arch_sample/features/domain/entities/breed_info.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BreedListViewCellWidget extends StatelessWidget {
  const BreedListViewCellWidget({super.key, required this.breed});

  final BreedInfo breed;

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return Card(
      child: ListTile(
        title: Text(breed.nameFormatter),
        onTap: () => router.navigate(BreedInfoRoute(breedInfo: breed)),
      ),
    );
  }
}
