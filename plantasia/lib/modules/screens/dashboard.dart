import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});

  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 100, 74),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 100, 74),
        title: Text(
          widget.title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(
            top: 100,
          ),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 242, 227, 219),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(200),
              topRight: Radius.circular(200),
            ),
          ),
        ),
      ),
    );
  }
}
