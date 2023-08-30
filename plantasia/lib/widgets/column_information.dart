import 'package:flutter/material.dart';
import 'package:plantasia/modules/models/plant.dart';

class PlantInfo extends StatelessWidget {
  final Plant plantData;
  const PlantInfo({super.key, required this.plantData});

  final TextStyle title = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold
  );
  final TextStyle textInfo = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

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
                style: title,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Nome comum: ${plantData.commonName}",
                style: textInfo,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Nomes científicos",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ), // Não sei por que ele não aceitou colocar style: title
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: plantData.scientificName.length,
                itemBuilder:(context, index) {
                  return Text(
                    plantData.scientificName[index],
                    style: textInfo,
                  );
                },
                physics: const NeverScrollableScrollPhysics(),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Ciclo: ${plantData.cycle}",
                style: textInfo,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Rega: ${plantData.watering}",
                style: textInfo,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Interna: ${plantData.indoor}",
                style: textInfo,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Necessidade de cuidado: ${plantData.careLevel}",
                style: textInfo,
              ), 
              const SizedBox(
                height: 8,
              ),
              Text(
                "Idade: ${plantData.age} semanas",
                style: textInfo,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Descrição: ${plantData.description}",
                style: textInfo,
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