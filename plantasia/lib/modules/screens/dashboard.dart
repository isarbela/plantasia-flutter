import 'package:flutter/material.dart';
import 'package:plantasia/modules/models/plant.dart';
import 'package:plantasia/modules/screens/new_plant.dart';
import 'package:plantasia/widgets/card_item.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title, required this.itens});

  final String title;
  final List<Plant> itens;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 58, 41),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 58, 41),
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
            top: 50,
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
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.itens.length,
                      itemBuilder: (context, index) {
                        return CardItem(plantData: widget.itens[index]);
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 232, 106, 51)),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.fromLTRB(16, 8, 16, 8)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewPlant()),
                        );
                      },
                      child: const Text(
                        '+ Adicionar Planta',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
