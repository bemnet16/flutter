import 'package:flutter/material.dart';
import 'package:project_notice/constants/colors.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
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
          children: const [
            CircleAvatar(
              maxRadius: 65,
              backgroundImage: AssetImage("assets/images/image-2.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Bemnet Adugnaw",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text("exmp@gmail.com")],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "SITE",
              style: TextStyle(fontSize: 17, color: kFontLight),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "3rd year",
              style: TextStyle(fontSize: 17, color: kFontLight),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ]),
    );
  }
}
