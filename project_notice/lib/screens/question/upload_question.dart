import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_notice/constants/colors.dart';
import 'package:project_notice/screens/question/Widgets/photo_upload.dart';
import '../../models/found_obj.dart';
import '../../models/questions.dart';
import 'Widgets/emoji_text.dart';
import 'Widgets/ask_question.dart';
import 'Widgets/find_where.dart';
import 'Widgets/give_hint.dart';

class AskQuestion extends StatefulWidget {
  @override
  State<AskQuestion> createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  File? objPhoto;
  List<Question>? questionlist;
  TextEditingController hinttext = TextEditingController();
  TextEditingController location = TextEditingController();
  FoundObj? foundObj;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhotoUploadPage(),
            FindWhere(),
            GiveHint(),
            const EmojiText(),
            QuestionInput(),
          ],
        ),
      ),
    );
  }
}
