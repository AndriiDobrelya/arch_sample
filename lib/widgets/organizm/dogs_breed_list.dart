import 'package:arch_sample/features/domain/entities/breed_info.dart';
import 'package:arch_sample/widgets/molecula/breed_list_view_cell.dart';
import 'package:flutter/material.dart';

class DogBreedListWidget extends StatelessWidget {

  const DogBreedListWidget({super.key, required this.breeds});
  final List<BreedInfo> breeds;

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
