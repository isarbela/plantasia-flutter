import 'package:flutter/material.dart';
import 'package:plantasia/modules/models/plant.dart';
import 'package:plantasia/modules/models/plant_db.dart';
import 'package:plantasia/modules/screens/new_plant.dart';
import 'package:plantasia/widgets/card_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../repositories/db.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});

  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<PlantDB> plants = [];

  @override
  void initState() {
    _fetchPlantsFromDatabase();
    super.initState();
  }

  void _fetchPlantsFromDatabase() async {
    final result = await DBProvider.db.getAllPlants();
    setState(() {
      plants = result;
    });
  }

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
                Text(
                  AppLocalizations.of(context)!.yourPlants,
                  style: const TextStyle(
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
                      itemCount: plants.length,
                      itemBuilder: (context, index) {
                        return CardItem(plantData: plants[index]);
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
                      child: Text(
                        AppLocalizations.of(context)!.addPlant,
                        style: const TextStyle(
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
