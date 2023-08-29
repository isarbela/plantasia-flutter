import 'package:flutter/material.dart';
import 'package:plantasia/modules/models/plant.dart';

class PlantInfo extends StatelessWidget {
  final Plant plantData;
  const PlantInfo({super.key, required this.plantData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nome: ${plantData.name}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Nome comum: ${plantData.commonName}"
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Nomes científicos",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: plantData.scientificName.length,
                itemBuilder:(context, index) {
                  return Text(plantData.scientificName[index]);
                },
                physics: const NeverScrollableScrollPhysics(),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Ciclo: ${plantData.cycle}",
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Rega: ${plantData.watering}",
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Interna: ${plantData.indoor}",
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Necessidade de cuidado: ${plantData.careLevel}",
              ), 
              const SizedBox(
                height: 8,
              ),
              Text(
                "Idade: ${plantData.age} semanas"
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Descrição: ${plantData.description}"
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        )
      ],
    );
  }
}