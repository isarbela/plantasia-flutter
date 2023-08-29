import 'package:flutter/material.dart';
import 'package:plantasia/modules/models/plant.dart';

class CardItem extends StatelessWidget {
  final Plant plantData;

  const CardItem({super.key, required this.plantData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Image.asset(
          plantData.image,
          fit: BoxFit.cover,
          height: 80,
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
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                plantData.species,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
