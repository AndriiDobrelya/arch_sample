import 'package:arch_sample/data/model/breed_model.dart';
import 'package:arch_sample/widgets/breed_list_view_cell.dart';
import 'package:flutter/material.dart';

class DogBreedListWidget extends StatelessWidget {
  final List<BreedModel> breeds;

  const DogBreedListWidget({super.key, required this.breeds});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: breeds.length,
        itemBuilder: (context, index) {
          final breed = breeds[index];
          return BreedListViewCellWidget(breed: breed);
        },
      ),
    );
  }
}
