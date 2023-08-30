import 'package:flutter/material.dart';
import 'package:plantasia/widgets/new_plant_form.dart';

class NewPlant extends StatelessWidget {
  const NewPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 58, 41),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 58, 41),
        title: const Text(
          'Aumente o seu jardim!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: NewPlantForm(),
    );
  }
}
