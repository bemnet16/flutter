import 'package:flutter/material.dart';

class LostFoundBtn extends StatelessWidget {
  final String btn;

  LostFoundBtn(this.btn);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue, // Set the text color
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 24.0,
        ),
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {},
      child: Text(
        btn,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
