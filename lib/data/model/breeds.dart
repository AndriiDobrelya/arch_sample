import 'dart:convert';

import 'package:arch_sample/data/model/breed_model.dart';

class Breeds {
  Breeds({
    required this.breedList,
    required this.status,
  });

  final List<BreedModel> breedList;
  final String status;

  static const String messageKey = "message";
  static const String statusKey = "status";

  factory Breeds.fromJson(Map<String, dynamic> json) {
    List<BreedModel> dogs = [];
    var status = json[statusKey];
    Map response = Map.from(json[messageKey]);
    response.forEach((breed, subBreeds) {
      List<String> subBreedList = List<String>.from(subBreeds);
      if (subBreedList.isNotEmpty) {
        for (var subBreed in subBreedList) {
          dogs.add(BreedModel(breed, subBreed));
        }
      } else {
        dogs.add(BreedModel(breed));
      }
    });
    return Breeds(breedList: dogs, status: status);
  }

  factory Breeds.dogModelFromJson(String str) =>
      Breeds.fromJson(json.decode(str));
}
