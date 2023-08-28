import 'package:flutter/material.dart';

class PlantDetails extends StatefulWidget {
  const PlantDetails({super.key, required this.title});

  final String title;

  @override
  State<PlantDetails> createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 100, 74),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 100, 74),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(
            top: 24,
          ),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 242, 227, 219),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(96),
              topRight: Radius.circular(96),
            )
          ),
          child: const Column(
            children: [
              SizedBox(height: 48,),
              Expanded(child: Placeholder(),)
              
            ],)
        ),
      ),
    );
  }
}