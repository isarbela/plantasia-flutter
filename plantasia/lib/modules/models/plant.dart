class Plant {
  final int id;
  final String? name;
  final String commonName;
  final List<dynamic> scientificName;
  final String? cycle;
  final String? watering;
  final String? indoor;
  final String? careLevel;
  final int? age;
  final String? description;

  Plant(
      {required this.id,
      required this.name,
      required this.commonName,
      required this.scientificName,
      required this.cycle,
      required this.watering,
      required this.indoor,
      required this.careLevel,
      required this.age,
      required this.description});

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
        id: json['id'],
        name: json['name'],
        commonName: json['common_name'],
        scientificName: json['scientific_name'],
        cycle: json['cycle'],
        watering: json['watering'],
        indoor: json['indoor'],
        careLevel: json['care_level'],
        age: json['age'],
        description: json['description']);
  }
}
