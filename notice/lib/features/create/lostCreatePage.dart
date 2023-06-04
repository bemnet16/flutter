import 'dart:io';
import 'package:bloc_test/features/lost_and_found/models/lost_items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../lost_and_found/bloc/blocs.dart';

class CreateLostPage extends StatefulWidget {
  @override
  _CreateLostPageState createState() => _CreateLostPageState();
}

class _CreateLostPageState extends State<CreateLostPage> {
  File? _image;
  final picker = ImagePicker();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  TextEditingController _adressController = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  String? _selectedCategory;
   final List<String> _categories =  [
    'ID',
    'Key',
    'Mobile phone',
    'Pc charger',
    'Mobile charger',
    'others',
  ];

  @override
  Widget build(BuildContext context) {
    final lostBloc = BlocProvider.of<LostAndFoundBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: "Enter title to the lost item",
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                items:
                    _categories.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  hintText: "Category of lost item",
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: "Enter a description",
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _placeController,
                decoration: const InputDecoration(
                  hintText: "Place where the item was lost",
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _adressController,
                decoration: const InputDecoration(
                  hintText: "Enter adress where you can be reached",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  handleCreate(context, lostBloc);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                ),
                child: const Text("Create Post"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleCreate(BuildContext context, lostBloc) {
    LostItem lostItem = LostItem(
        title: _titleController.text,
        description: _descriptionController.text,
        category: _selectedCategory!,
        userAddress: [_adressController.text],
        userId: "6477bdf792aa4e51ef73d838",
        userName: "abel",
        location: _placeController.text);
    lostBloc.add(CreateLostItem(lostItem: lostItem));
    Navigator.pop(context);
  }
}
