import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../models/users.dart';
import '../../question/Widgets/category_title.dart';
import 'user_post.dart';

class PostDetail extends StatelessWidget {
  final userLists = Users.generateCourses();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: userLists.length,
            separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
            itemBuilder: (context, index) => UserPost(userLists[index]),
          ),
        ),
      ]),
    );
  }
}
