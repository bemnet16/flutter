import 'package:flutter/material.dart';

import '../../user/ui/constants/colors.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key, this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child:  Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(data.location,
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
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(data.userAddress[0],
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
