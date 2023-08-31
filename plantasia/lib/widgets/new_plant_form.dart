import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantasia/modules/models/plant_db.dart';
import 'package:plantasia/modules/repositories/db.dart';
import 'package:plantasia/modules/screens/dashboard.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:plantasia/modules/repositories/plant_repository.dart';

class NewPlantForm extends StatefulWidget {
  const NewPlantForm({super.key});

  @override
  NewPlantFormState createState() => NewPlantFormState();
}

class NewPlantFormState extends State<NewPlantForm> {
  List<String> commonNames = [];
  String _nameValue = '';
  String _selectedSpinnerValue = "European Silver Fir";
  late double _numberValue;
  File? imageFile;
  final _formKey = GlobalKey<NewPlantFormState>();

  _savePlant(plant) {
    DBProvider.db.insertPlant(plant);
  }

  @override
  void initState() {
    _fetchPlantsNames();
    super.initState();
  }

  void _fetchPlantsNames() async {
    final result = await PlantRepository().fetchPlants();
    setState(() {
      commonNames = result.map((plant) => plant.commonName).toList();
      print(commonNames);
    });
  }

  _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: 'Name',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _nameValue = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: AppLocalizations.of(context)!.ageLabel,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _numberValue = double.tryParse(value)!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  DropdownButton<String>(
                    menuMaxHeight: 400,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                    value: _selectedSpinnerValue,
                    dropdownColor: const Color.fromARGB(255, 65, 100, 74),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedSpinnerValue = newValue!;
                      });
                    },
                    items: commonNames
                        .map<DropdownMenuItem<String>>((String name) {
                      return DropdownMenuItem<String>(
                        value: name,
                        child: Text(
                          name,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.imageLabel,
                        style: const TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        onPressed: _pickImage,
                        icon: const Icon(
                          Icons.camera_alt,
                        ),
                      ),
                    ],
                  ),
                  imageFile != null
                      ? Image.file(
                          imageFile!,
                          fit: BoxFit.cover,
                          width: 300,
                          height: 300,
                        )
                      : Container(),
                  ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 232, 106, 51)),
                      ),
                      onPressed: () {
                        if (imageFile != null) {
                          _savePlant(PlantDB(imageFile!.readAsBytesSync(),
                              id: const Uuid().v1(),
                              name: _nameValue,
                              commonName: _selectedSpinnerValue,
                              age: _numberValue.toString()));
                        } else {
                          _savePlant(PlantDB(null,
                              id: const Uuid().v1(),
                              name: _nameValue,
                              commonName: _selectedSpinnerValue,
                              age: _numberValue.toString()));
                        }
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Salvar planta',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
