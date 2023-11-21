import 'package:bloc_test/features/auth/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../routes/app_route_const.dart';
import '../bloc/auth_bloc.dart';
import 'constants/colors.dart';
import 'widgets/textfield.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignupPage> {
  File? _image;
  String? selectedYear;
  String? selectedDep;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final yearController = TextEditingController();
  final departmentController = TextEditingController();

  List<String> year = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  final List<String> departmentNames = [
    'electrical',
    'software',
    'civil',
    'mechanical',
    'biomedical',
    'chemical',
  ];

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignupChecked) {
            GoRouter.of(context).goNamed(MyAppRouteConstants.loginRouteName);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/back.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: backcolor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 30.0),
                        GestureDetector(
                          onTap: getImage,
                          child: _image == null
                              ? Container(
                                  height: 80,
                                  width: 80,
                                  color: Colors.grey[400],
                                  child: const Icon(
                                    Icons.add_a_photo,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(_image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                            controller: nameController,
                            hintText: 'Full name',
                            obscureText: false),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                            controller: emailController,
                            hintText: 'Enter email',
                            obscureText: false),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                            controller: userNameController,
                            hintText: 'what should we call you',
                            obscureText: false),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                            controller: passwordController,
                            hintText: 'Enter your password',
                            obscureText: true),
                        const SizedBox(height: 20.0),

                        DropdownButtonFormField<String>(
                          value: selectedYear,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedYear = newValue;
                            });
                          },
                          items: year
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            hintText: "year of study",
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        DropdownButtonFormField<String>(
                          value: selectedDep,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedDep = newValue;
                            });
                          },
                          items: departmentNames
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            hintText: "department",
                          ),
                        ),
                        const SizedBox(height: 20.0),

                        // CustomBtn('Sign Up'),
                        ElevatedButton(
                            onPressed: () {
                              handleSignup(authBloc);
                            },
                            child: const Text("Signup")),
                        const SizedBox(height: 40.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void handleSignup(authBloc) {
    User user;
    if (_image != null) {
      user = User(
          firstName: nameController.text.split(' ')[0],
          lastName: nameController.text.split(' ')[1],
          userName: userNameController.text,
          email: emailController.text,
          password: passwordController.text,
          YearOfStudy: int.parse(selectedYear!),
          Program: selectedDep!,
          profileImage: _image);
    } else {
      user = User(
          firstName: nameController.text.split(' ')[0],
          lastName: nameController.text.split(' ')[1],
          userName: userNameController.text,
          email: emailController.text,
          password: passwordController.text,
          YearOfStudy: int.parse(selectedYear!),
          Program: selectedDep!);
    }
    authBloc.add(SignUpEvent(user: user));
  }
}
