import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                    labelText: AppLocalizations.of(context)!.nameLabel,
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
                    labelText: AppLocalizations.of(context)!.ageLabel,
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
                    Text(AppLocalizations.of(context)!.imageLabel),
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
                      )
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
