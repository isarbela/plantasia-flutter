import 'package:flutter/material.dart';
import 'package:plantasia/modules/models/plant.dart';
import 'package:plantasia/widgets/column_information.dart';

class PlantDetails extends StatefulWidget {
  const PlantDetails({super.key, required this.title, required this.plantData});

  final String title;
  final Plant plantData;

  @override
  State<PlantDetails> createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 227, 219),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 58, 41),
        title: Text(
          widget.title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const SizedBox(
            height: 16,
          ),
          PlantInfo(plantData: widget.plantData)
        ],
      )),
    );
  }
}
