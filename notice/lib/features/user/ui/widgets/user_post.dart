import 'package:flutter/material.dart';


import '../constants/colors.dart';
import '../models/users.dart';

class UserPost extends StatelessWidget {
  final  users;
  const UserPost(this.users, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 250,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: kPrimaryLight, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child:users.imageUrl!=null? Image(
                      image: NetworkImage(users.imageUrl),
                      fit: BoxFit.cover,
                    ):Container(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:users.userPicturePath!=null? NetworkImage(users.userPicturePath):null,
                              radius: 10,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              users.userName,
                              style: const TextStyle(
                                  color: kFontLight,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
