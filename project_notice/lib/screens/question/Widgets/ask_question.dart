import 'package:flutter/material.dart';
import 'package:project_notice/constants/colors.dart';

import '../../../models/questions.dart';

class QuestionInput extends StatefulWidget {
  @override
  State<QuestionInput> createState() => _QuestionInputState();
}

class _QuestionInputState extends State<QuestionInput> {
  TextEditingController questionController = TextEditingController();

  TextEditingController correctAnswerController = TextEditingController();

  TextEditingController option1Controller = TextEditingController();

  TextEditingController option2Controller = TextEditingController();

  TextEditingController option3Controller = TextEditingController();

  bool isAsk = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: isAsk
            ? Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                    decoration: _containerBoxDeco(),
                    child: TextField(
                      controller: questionController,
                      decoration: InputDecoration(
                          fillColor: kFontLight.withOpacity(0.1),
                          filled: true,
                          contentPadding: const EdgeInsets.all(18),
                          border: InputBorder.none,
                          hintText: 'Enter question here ... ',
                          hintStyle: const TextStyle(color: kFontLight)),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    decoration: _containerBoxDeco(),
                    child: TextField(
                      controller: correctAnswerController,
                      decoration: _optionDeco('Enter correct answer '),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    decoration: _containerBoxDeco(),
                    child: TextField(
                      controller: option1Controller,
                      decoration: _optionDeco('Enter option one '),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    decoration: _containerBoxDeco(),
                    child: TextField(
                      controller: option2Controller,
                      decoration: _optionDeco('Enter option two '),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    decoration: _containerBoxDeco(),
                    child: TextField(
                      controller: option3Controller,
                      decoration: _optionDeco('Enter option three '),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kFontLight,
                          padding: const EdgeInsets.all(13),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        String question = questionController.text;
                        String correctAnswer = correctAnswerController.text;
                        List<String> options = [
                          option1Controller.text,
                          option2Controller.text,
                          option3Controller.text,
                        ];
                        Question newQuestion =
                            Question(question, correctAnswer, options);
                        questionController.text = "";
                        correctAnswerController.text = "";
                        option1Controller.text = "";
                        option2Controller.text = "";
                        option3Controller.text = "";
                      },
                      child: Center(child: Text('Add Question')),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              )
            : Container(
                margin: const EdgeInsets.all(15),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kFontLight,
                        padding: const EdgeInsets.all(13),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      setState(() {
                        isAsk = !isAsk;
                      });
                    },
                    child: const Center(child: Text("Ask Question"))),
              ));
  }

  InputDecoration _optionDeco(hint) {
    return InputDecoration(
        fillColor: kBackground.withOpacity(0.1),
        filled: true,
        contentPadding: const EdgeInsets.all(13),
        border: InputBorder.none,
        hintText: hint,
        hintStyle: const TextStyle(color: kFontLight));
  }

  BoxDecoration _containerBoxDeco() {
    return BoxDecoration(
        border: Border.all(color: kFontLight.withOpacity(0.3), width: 2),
        borderRadius: BorderRadius.circular(17));
  }
}
