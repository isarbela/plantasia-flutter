import 'package:flutter/material.dart';
import 'package:plantasia/modules/models/plant.dart';
import 'package:plantasia/modules/screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plantasia',
      theme: ThemeData(
        fontFamily: 'Mulish',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 65, 100, 74)),
        useMaterial3: true,
      ),
      home: Dashboard(
        title: 'Plantasia',
        itens: [
          Plant("assets/placeholder.png",
              name: "Susan", age: 12, species: "Cajueiro"),
        ],
      ),
    );
  }
}
