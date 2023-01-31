import 'package:arch_sample/features/domain/entities/breed_info.dart';
import 'package:flutter/material.dart';

class BreedInfoLayout extends StatelessWidget {
  const BreedInfoLayout({super.key, required this.breedInfo});

  final BreedInfo breedInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Text(breedInfo.breed),
        ),
      ),
    );
  }
}
