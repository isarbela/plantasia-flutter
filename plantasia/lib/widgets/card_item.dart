import 'package:flutter/material.dart';
import 'package:plantasia/modules/models/plant.dart';

class CardItem extends StatelessWidget {
  final Plant plantData;

  const CardItem({super.key, required this.plantData});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: const Color.fromARGB(255, 65, 100, 74),
      child: Row(children: [
        Image.asset(
          plantData.image,
          fit: BoxFit.contain,
          height: 100,
        ),
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
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 4,
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
    );
  }
}
