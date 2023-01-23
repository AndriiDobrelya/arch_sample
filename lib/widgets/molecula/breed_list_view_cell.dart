import 'package:arch_sample/features/domain/entities/breed_info.dart';
import 'package:flutter/material.dart';

class BreedListViewCellWidget extends StatelessWidget {
  final BreedInfo breed;

  const BreedListViewCellWidget({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(breed.nameFormatter),
        onTap: () {},
      ),
    );
  }
}