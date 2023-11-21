import 'package:flutter/material.dart';
import 'package:project_notice/screens/user/widgets/saved_history.dart';
import 'package:project_notice/screens/user/widgets/settings.dart';
import 'package:project_notice/screens/user/widgets/user_info.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white54,
        child: ListView(
          children: [
            UserInfo(),
            SavedHistory(),
            Setting(),
          ],
        ),
      ),
    );
  }
}
