import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantasia/modules/models/plant_db.dart';
import 'package:plantasia/modules/repositories/db.dart';
import 'package:uuid/uuid.dart';

class NewPlantForm extends StatefulWidget {
  const NewPlantForm({super.key});

  @override
  NewPlantFormState createState() => NewPlantFormState();
}

class NewPlantFormState extends State<NewPlantForm> {
  String _nameValue = '';
  String _selectedSpinnerValue = 'Option 1';
  late double _numberValue;
  File? imageFile;
  final _formKey = GlobalKey<NewPlantFormState>();

  _savePlant(plant) {
    print(plant.toString());
    DBProvider.db.insertPlant(plant);
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
    return Form(
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
                    hintText: 'Age (in weeks)',
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
                  value: _selectedSpinnerValue,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedSpinnerValue = newValue!;
                    });
                  },
                  items: <String>['Option 1', 'Option 2', 'Option 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Image input:',
                      style: TextStyle(color: Colors.white),
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
                  onPressed: () {
                    if (imageFile != null) {
                      _savePlant(
                        PlantDB(
                          imageFile!.readAsBytesSync(),
                          id: const Uuid().v1(),
                          name: _nameValue,
                          commonName: _selectedSpinnerValue,
                          age: _numberValue.toString()
                        )
                      );
                    } else {
                      _savePlant(
                          PlantDB(
                            null,
                            id: const Uuid().v1(),
                            name: _nameValue,
                            commonName: _selectedSpinnerValue,
                            age: _numberValue.toString()
                          )
                        );
                    }
                  },
                  child: const Text(
                    'Salvar planta',
                    style: TextStyle(color: Colors.white),
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
