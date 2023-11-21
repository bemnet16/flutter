import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:project_notice/constants/colors.dart';

class FindWhere extends StatefulWidget {
  const FindWhere({super.key});

  @override
  State<FindWhere> createState() => _FindWhereState();
}

class _FindWhereState extends State<FindWhere> {
  TextEditingController wherefindtxt = TextEditingController();
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
          Text("found where",
              style: TextStyle(
                  color: kFont.withOpacity(0.5),
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          TextField(
              controller: wherefindtxt,
              decoration: InputDecoration(
                fillColor: kBackground.withOpacity(0.1),
                filled: true,
                contentPadding: const EdgeInsets.all(13),
                hintText: "where  do you found it?",
                hintStyle: const TextStyle(color: kFontLight),
              ))
        ],
      ),
    );
  }
}
