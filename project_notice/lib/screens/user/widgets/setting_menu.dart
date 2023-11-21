import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: kFontLight, width: 2),
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back)),
            title: const Text("Change Password"),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                hintText: "old password"),
          )
        ],
      ),
    );
  }
}
