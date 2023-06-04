import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../constants/colors.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key,required this.user});
  final User  user;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 10,
      ),
      ListTile(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            maxRadius: 65,
            backgroundImage: user.profileImage!=null?NetworkImage(user.profileImage!):null,
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${user.firstName} ${user.lastName}",
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
          )
        ],
      ),
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(user.email)],
      ),
      const SizedBox(
        height: 8,
      ),
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            user.Program,
            style: const TextStyle(fontSize: 17, color: kFontLight),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "${user.YearOfStudy} year",
            style: const TextStyle(fontSize: 17, color: kFontLight),
          )
        ],
      ),
      const SizedBox(
        height: 30,
      ),
    ]);
  }
}
