import 'package:flutter/material.dart';
import 'foundBottomSheet.dart';

class Found extends StatelessWidget {
  const Found({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/image-3.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                    leading: const CircleAvatar(
                      radius: 24.0,
                      backgroundImage: AssetImage('assets/images/image-1.png'),
                    ),
                    title: const Text(
                      "user's name",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      'May 31, 2023',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: FoundBottomSheet(),
                  ),
                  const Divider(),
                  const Text(
                    ' cannot be a direct child of an Expanded widget. The Expanded widget is used to define flexible space within a parent widget, typically a Row or Flex, allowing its child widget to take up any remaining space after other non-flexible widgets are laid out.',
                    style: TextStyle(fontSize: 17),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.location_on),
                              Text(
                                'Location',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.phone),
                              Text(
                                'Phone Number',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider()
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Divider(
                    thickness: 12,
                    color: Colors.grey[300],
                  ),
                ],
              ));
        },
        separatorBuilder: (context, index) => const SizedBox.shrink());
  }
}
