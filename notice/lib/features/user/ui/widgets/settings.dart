import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import 'edit_profile.dart';

class Setting extends StatelessWidget {
  const Setting({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white70,
          margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child:  ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.black54,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: EditProfile(user: user,),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Card(
          color: Colors.white70,
          margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.black54,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_outlined)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
