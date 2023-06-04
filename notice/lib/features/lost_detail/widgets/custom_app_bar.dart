import 'package:flutter/material.dart';

import '../../user/ui/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  final data;

  const CustomAppBar({super.key, required this.data});
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
                  image: NetworkImage(
                      'https://i.pinimg.com/236x/e9/b1/c8/e9b1c82ae39976848a87870edc13f5c5.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: null,
                            radius: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.userName,
                                style: TextStyle(
                                    color: kFont,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: MediaQuery.of(context).padding,
                  child:  Text(
                    data.category,
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
