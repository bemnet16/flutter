import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants/colors.dart';

class GiveHint extends StatelessWidget {
  TextEditingController hinttext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(35),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
          color: kPrimaryLight.withOpacity(0.2),
          border: Border.all(color: kAccent.withOpacity(0.3), width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("some description",
              style: TextStyle(
                  color: kFont.withOpacity(0.5),
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          TextField(
              controller: hinttext,
              decoration: InputDecoration(
                fillColor: kBackground.withOpacity(0.1),
                filled: true,
                contentPadding: const EdgeInsets.all(13),
                hintText: "how can be identified?",
                hintStyle: const TextStyle(color: kFontLight),
              ))
        ],
      ),
    );
  }
}
