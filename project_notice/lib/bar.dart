import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        padding: const EdgeInsets.only(top: 30, right: 30),
        child: Column(children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.sort_rounded,
                    color: Colors.orange,
                    size: 30,
                  )),
              const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(
                  'assets/images/image-2.png',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            child: const Text("users name",
                style: TextStyle(
                  fontSize: 26,
                )),
          ),
          const Divider()
        ]),
      ),
    );
  }
}
