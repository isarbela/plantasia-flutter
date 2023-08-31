import 'dart:typed_data';

class PlantDB {
  final String id;
  final String name;
  final String commonName;
  final String age;
  final Uint8List? image;

  PlantDB(this.image,
      {required this.id,
      required this.name,
      required this.commonName,
      required this.age});

  factory PlantDB.fromMap(Map<String, dynamic> map) {
    return PlantDB(map['image'],
        id: map['id'],
        name: map['name'],
        commonName: map['commonName'],
        age: map['age']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'commonName': commonName,
      'age': age,
      'image': image,
    };
  }
}
