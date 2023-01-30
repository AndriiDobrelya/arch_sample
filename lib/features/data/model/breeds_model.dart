import 'dart:convert';

import 'package:arch_sample/features/domain/entities/breed_info.dart';
import 'package:arch_sample/features/domain/entities/breeds.dart';

class BreedsModel extends Breeds {
  BreedsModel({
    required super.breedList,
    required this.status,
  });

  factory BreedsModel.fromJson(Map<String, dynamic> json) {
    final List<BreedInfo> dogs = [];
    final status = json[statusKey];
    final Map response = Map.from(json[messageKey]);
    response.forEach((breed, subBreeds) {
      final List<String> subBreedList = List<String>.from(subBreeds);
      if (subBreedList.isNotEmpty) {
        for (var subBreed in subBreedList) {
          dogs.add(BreedInfo(breed, subBreed));
        }
      } else {
        dogs.add(BreedInfo(breed));
      }
    });
    return BreedsModel(breedList: dogs, status: status);
  }

  factory BreedsModel.dogModelFromJson(String str) => BreedsModel.fromJson(json.decode(str));

  final String status;

  static const String messageKey = "message";
  static const String statusKey = "status";
}
