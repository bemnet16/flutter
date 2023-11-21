import 'package:flutter/material.dart';
import 'package:project_notice/screens/user/widgets/edit_profile.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white70,
          margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.black54,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: EditProfile(),
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
