class Plant {
  final String name;
  final String commonName;
  final List<String> scientificName;
  final String cycle;
  final String watering;
  final String indoor;
  final String careLevel;
  final int age;
  final String image;
  final String description;

  Plant(this.image,
      {
        required this.name, 
        required this.commonName, 
        required this.scientificName, 
        required this.cycle, 
        required this.watering, 
        required this.indoor, 
        required this.careLevel, 
        required this.age, 
        required this.description
      }
  );
}
