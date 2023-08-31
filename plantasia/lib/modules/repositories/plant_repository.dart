import 'dart:convert';

import 'package:plantasia/modules/models/plant.dart';
import 'package:http/http.dart' as http;

class PlantRepository {
  Future<List<Plant>> fetchPlants() async {
    final response = await http.get(Uri.parse(
        'https://perenual.com/api/species-list?page=1&key=sk-hZ3g649f8c6a002541442'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)["data"];
      return data.map((e) => Plant.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch plants');
    }
  }
}
