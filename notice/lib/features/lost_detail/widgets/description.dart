import 'package:flutter/material.dart';

import '../../user/ui/constants/colors.dart';

class Description extends StatelessWidget {
  const Description({super.key,this.data});
  final data;

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
           Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              data.title,
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
            child:  Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(data.description),
            ),
          )
        ],
      ),
    );
  }
}
