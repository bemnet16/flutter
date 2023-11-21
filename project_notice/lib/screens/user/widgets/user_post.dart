import 'package:flutter/material.dart';
import 'package:project_notice/constants/colors.dart';
import 'package:project_notice/models/users.dart';

class UserPost extends StatelessWidget {
  final Users users;
  UserPost(this.users);

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
            decoration: BoxDecoration(
                color: kPrimaryLight, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image(
                      image: AssetImage('assets/images/image-1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/image-2.png'),
                              radius: 10,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              users.user,
                              style: const TextStyle(
                                  color: kFontLight,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Are You Sure!"),
                                    content: Text(
                                        "you are trying to delete your history."),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "successfully delted")));
                                            Navigator.pop(context);
                                          },
                                          child: const Text("DELETE"))
                                    ],
                                  );
                                });
                          },
                          icon: const Icon(Icons.delete)),
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
