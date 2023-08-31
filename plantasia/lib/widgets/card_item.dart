import 'package:flutter/material.dart';
import 'package:plantasia/modules/models/plant.dart';
import 'package:plantasia/modules/models/plant_db.dart';
import 'package:plantasia/modules/screens/plant_details.dart';

class CardItem extends StatelessWidget {
  final PlantDB plantData;

  const CardItem({super.key, required this.plantData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlantDetails(
                    title: '${plantData.name}(${plantData.commonName})',
                    plantData: plantData,
                  )),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: const Color.fromARGB(255, 65, 100, 74),
        child: Row(children: [
          (plantData.image != null)
              ? Image.memory(
                  plantData.image!,
                  fit: BoxFit.contain,
                  height: 100,
                )
              : const SizedBox(),
          const SizedBox(
            width: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plantData.name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 242, 227, 219)),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '${plantData.age} semanas de idade',
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  plantData.commonName.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 242, 227, 219)),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
