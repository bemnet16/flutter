import 'package:flutter/material.dart';
import 'package:project_notice/constants/colors.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
          color: kPrimaryLight, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Title",
              style: TextStyle(
                  color: kFontLight, fontWeight: FontWeight.bold, fontSize: 23),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            decoration: BoxDecoration(
                border: Border.all(color: kAccent.withOpacity(0.3), width: 2),
                borderRadius: BorderRadius.circular(17)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("descriptions goes here"),
            ),
          )
        ],
      ),
    );
  }
}
