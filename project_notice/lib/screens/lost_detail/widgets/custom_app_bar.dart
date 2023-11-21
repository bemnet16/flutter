import 'package:flutter/material.dart';
import 'package:project_notice/constants/colors.dart';
import 'package:project_notice/models/users.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                height: 300,
                child: const Image(
                  image: AssetImage('assets/images/image-2.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/image-3.png'),
                          radius: 20,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'users',
                              style: TextStyle(
                                  color: kFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            Text("User's address")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: MediaQuery.of(context).padding,
                  child: const Text(
                    "Category",
                    style: TextStyle(color: kFont, fontSize: 16),
                  ),
                )
              ]),
              const Divider()
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 30,
            left: 30,
            child: Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                  color: kFont.withOpacity(0.2), shape: BoxShape.circle),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
