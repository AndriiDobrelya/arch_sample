import 'dart:convert';

import 'package:arch_sample/features/domain/entities/breed_info.dart';
import 'package:arch_sample/features/domain/entities/breeds.dart';

class BreedsModel extends Breeds {
  BreedsModel({
    required List<BreedInfo> breedList,
    required this.status,
  }) : super(breedList: breedList);

  final String status;

  static const String messageKey = "message";
  static const String statusKey = "status";

  factory BreedsModel.fromJson(Map<String, dynamic> json) {
    List<BreedInfo> dogs = [];
    var status = json[statusKey];
    Map response = Map.from(json[messageKey]);
    response.forEach((breed, subBreeds) {
      List<String> subBreedList = List<String>.from(subBreeds);
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
}
