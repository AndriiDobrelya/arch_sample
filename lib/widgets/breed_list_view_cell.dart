import 'package:arch_sample/data/model/breed_model.dart';
import 'package:flutter/material.dart';

class BreedListViewCellWidget extends StatelessWidget {
  final BreedModel breed;

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
