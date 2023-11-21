import 'dart:io';

import 'package:project_notice/models/questions.dart';

class FoundObj {
  File photo;
  List<Question> questions;
  String findlocation;
  String somehint;

  FoundObj(this.photo, this.questions, this.findlocation, this.somehint);
}
