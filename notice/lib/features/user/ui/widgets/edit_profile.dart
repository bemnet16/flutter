import 'package:bloc_test/features/user/bloc/blocs.dart';
import 'package:bloc_test/features/user/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../constants/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.user});
  final User user;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController year;
  late TextEditingController department;
  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.user.userName);
    email = TextEditingController(text: widget.user.email);
    department = TextEditingController(text: widget.user.Program);
    year = TextEditingController(text: widget.user.YearOfStudy.toString());
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
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
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 15,
                      right: 15),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: name,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'your name',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                            filled: true,
                            hintText: "name"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: email,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            labelText: 'email',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                            hintText: "email"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: year,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            labelText: 'year of study',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                            hintText: "year of study"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: department,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            labelText: 'department',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                            hintText: "department"),
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
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              handleUpdate(
                                  user: widget.user,
                                  bloc: userBloc,
                                  context: context);
                            },
                            child: const Center(child: Text("Update"))),
                      )
                    ],
                  ),
                );
              });
        },
        icon: const Icon(Icons.arrow_forward_ios_outlined));
  }

  void handleUpdate({user, bloc, context}) {
    final updatedUser = {
      "id":user.id,
      "userName": name.text,
      "email": email.text,
      "YearOfStudy":int.parse(year.text) ,
      "Program": department.text
    };
    bloc.add(UpdateUser(user: updatedUser));
    Navigator.pop(context);
  }
}
