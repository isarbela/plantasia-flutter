import 'package:flutter/material.dart';
import 'package:plantasia/modules/models/plant_db.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:plantasia/modules/repositories/db.dart';

class PlantInfo extends StatelessWidget {
  final PlantDB plantData;
  const PlantInfo({super.key, required this.plantData});

  final TextStyle title =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final TextStyle textInfo = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  _deletePlant() {
    DBProvider.db.deletePlant(plantData);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (plantData.image != null)
                  ? Image.memory(
                      plantData.image!,
                      fit: BoxFit.fitWidth,
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 8,
              ),
              Text(
                "${AppLocalizations.of(context)!.nameLabel}: ${plantData.name}",
                style: title,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "${AppLocalizations.of(context)!.commonNameLabel}: ${plantData.commonName}",
                style: textInfo,
              ),
              const SizedBox(
                height: 8,
              ),
              // const Text(
              //   "Nomes científicos",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 20,
              //   ), // Não sei por que ele não aceitou colocar style: title
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: plantData.scientificName.length,
              //   itemBuilder: (context, index) {
              //     return Text(
              //       plantData.scientificName[index],
              //       style: textInfo,
              //     );
              //   },
              //   physics: const NeverScrollableScrollPhysics(),
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // Text(
              //   "Ciclo: ${plantData.cycle}",
              //   style: textInfo,
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // Text(
              //   "Rega: ${plantData.watering}",
              //   style: textInfo,
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // Text(
              //   "Interna: ${plantData.indoor}",
              //   style: textInfo,
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // Text(
              //   "Necessidade de cuidado: ${plantData.careLevel}",
              //   style: textInfo,
              // ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "${AppLocalizations.of(context)!.ageLabel}: ${plantData.age}",
                style: textInfo,
              ),
              const SizedBox(
                height: 8,
              ),
              // Text(
              //   "Descrição: ${plantData.description}",
              //   style: textInfo,
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 232, 106, 51)),
                  ),
                  onPressed: () {
                    _deletePlant();
                    Navigator.pop(context, 'delete_plant');
                  },
                  child: const Text(
                    'Apagar planta',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
