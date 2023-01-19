class BreedModel {
  final String breed;
  final String? subBreed;

  String get nameFormatter => subBreed == null ? breed : "$breed $subBreed";

  BreedModel(this.breed, [this.subBreed]);
}
