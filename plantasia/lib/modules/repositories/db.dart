import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/plant_db.dart';

const tableName = 'quotes';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database? _database;
  Future<Database> get database async => _database ?? await _initDB();

  Future<Database> _initDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'plantasia.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName(id TEXT PRIMARY KEY,'
          'name TEXT,'
          'commonName TEXT,'
          'age TEXT,'
          'image BLOB)',
        );
      },
      version: 1,
    );
  }

  Future<List<PlantDB>> getAllPlants() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (i) => PlantDB.fromMap(maps[i]));
  }

  Future<void> insertPlant(PlantDB plant) async {
    final db = await database;
    await db.insert(tableName, plant.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updatePlant(PlantDB plant) async {
    final db = await database;
    await db.update(tableName, plant.toMap(),
        where: 'id = ?', whereArgs: [plant.id]);
  }

  Future<void> deletePlant(PlantDB plant) async {
    final db = await database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [plant.id]);
  }
}
