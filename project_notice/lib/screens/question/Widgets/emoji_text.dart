import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants/colors.dart';

class EmojiText extends StatelessWidget {
  const EmojiText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "How Can YOU know/identify\n the onwer??",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kFont.withOpacity(0.75))),
          const TextSpan(
              text: "+``",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 26, color: kFontLight))
        ]),
      ),
    );
  }
}
