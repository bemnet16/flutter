import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController department = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? emailErrorMessage;
  String? departmentErrorMessage;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          isDismissible: true,
          context: context,
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: kFontLight, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: name,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        hintText: 'name',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        hintText: 'email',
                        errorText: emailErrorMessage,
                      ),
                      onChanged: (value) {
                        setState(() {
                          emailErrorMessage = null;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email.';
                        }
                        final emailRegex = RegExp(
                            r'^[\w-]+(\.[\w-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        hintText: 'password',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: department,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        hintText: 'department',
                        errorText: departmentErrorMessage,
                      ),
                      onChanged: (value) {
                        setState(() {
                          departmentErrorMessage = null;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a department.';
                        }
                        final departmentNumber = int.tryParse(value);
                        if (departmentNumber == null ||
                            departmentNumber < 1 ||
                            departmentNumber > 5) {
                          return 'Please enter a department between 1 and 5.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kFontLight,
                          padding: const EdgeInsets.all(13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Valid form, update profile
                            setState(() {
                              // Perform the profile update
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: const Center(child: Text('Update')),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.arrow_forward_ios_outlined),
    );
  }
}
