import 'package:flutter/material.dart';

class NewPlant extends StatelessWidget {
  const NewPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 100, 74),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 100, 74),
        title: const Text(
          'Aumente o seu jardim!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
