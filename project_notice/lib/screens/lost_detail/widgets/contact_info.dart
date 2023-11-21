import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text("+251 9 842334",
                  style: TextStyle(
                      color: kFontLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            Icon(
              Icons.phone_android_rounded,
              color: kAccent,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text("Addis Ababa",
                  style: TextStyle(
                      color: kFontLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            Icon(
              Icons.location_pin,
              color: kAccent,
            ),
          ],
        )
      ]),
    );
  }
}
