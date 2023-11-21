import 'package:flutter/material.dart';

class Lost extends StatefulWidget {
  const Lost({Key? key}) : super(key: key);

  @override
  State<Lost> createState() => _LostState();
}

class _LostState extends State<Lost> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  'May 31, 2023',
                  style: TextStyle(
                      color: Color.fromRGBO(27, 233, 233, 1), fontSize: 16),
                ),
              ),
              const Text(
                'I have lost my key.',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300),
              ),
              const Text(
                'Subtitle',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const CircleAvatar(
                  radius: 24.0,
                  backgroundImage: AssetImage('images/image-1.png'),
                ),
                title: const Text(
                  "user's name",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: const Text(
                  'location',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_double_arrow_right_rounded,
                    color: Colors.yellow,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
    );
  }
}
