import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomBtn extends StatelessWidget {
  final String btnName;
  const CustomBtn(this.btnName);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: btncolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          ),
        ),
        child: Text(
          btnName,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
