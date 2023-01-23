class BreedInfo {
  final String breed;
  final String? subBreed;

  String get nameFormatter => subBreed == null ? breed : "$breed $subBreed";

  BreedInfo(this.breed, [this.subBreed]);
}
