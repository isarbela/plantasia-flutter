import 'package:flutter/material.dart';
import 'package:plantasia/modules/screens/new_plant.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title, required this.itens});

  final String title;
  final List<String> itens;

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
          width: MediaQuery.of(context).size.width,
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
          child: Padding(
            padding: const EdgeInsets.only(top: 140.0, right: 16.0, left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Suas Plantas",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.itens.length,
                      prototypeItem: ListTile(
                        title: Text(widget.itens.first),
                      ),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(widget.itens[index]),
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.orange),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewPlant()),
                          );
                        },
                        child: const Text('+ Adicionar Planta')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
