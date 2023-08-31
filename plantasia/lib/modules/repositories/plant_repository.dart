import 'dart:convert';

import 'package:plantasia/modules/models/plant.dart';
import 'package:http/http.dart' as http;

class PlantRepository {
  Future<List<Plant>> fetchPlants() async {
    final response = await http.get(Uri.parse(
        'https://perenual.com/api/species-list?page=1&key=sk-hZ3g649f8c6a002541442'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return List.generate(data.length, (index) => Plant.fromJson(data[index]));
    } else {
      throw Exception('Failed to fetch plants');
    }
  }

  List<String> getNames() {
    List<Plant> plants = [];
    fetchPlants().then((value) => plants = value);
    return plants.map((plant) => plant.commonName).toList();
  }
}
