class BreedInfo {

  BreedInfo(this.breed, [this.subBreed]);
  final String breed;
  final String? subBreed;

  String get nameFormatter => subBreed == null ? breed : "$breed $subBreed";
}
