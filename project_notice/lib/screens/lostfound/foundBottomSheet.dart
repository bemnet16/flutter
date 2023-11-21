import 'package:flutter/material.dart';

class Question {
  final String question;
  final List<String> options;

  Question({required this.question, required this.options});
}

class FoundBottomSheet extends StatefulWidget {
  @override
  _FoundBottomSheetState createState() => _FoundBottomSheetState();
}

class _FoundBottomSheetState extends State<FoundBottomSheet> {
  List<Question> questions = [
    Question(
      question: 'Question 1',
      options: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
    ),
    Question(
      question: 'Question 2',
      options: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
    ),
    Question(
      question: 'Question 3',
      options: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
    ),
  ];

  int currentQuestionIndex = 0;
  List<int?> selectedOptions = [];

  @override
  void initState() {
    super.initState();
    selectedOptions = List<int?>.filled(questions.length, null);
  }

  @override
  Widget build(BuildContext context) {
    if (selectedOptions.isEmpty) {
      selectedOptions = List<int?>.filled(questions.length, null);
    }

    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        questions[currentQuestionIndex].question,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: List.generate(
                          questions[currentQuestionIndex].options.length,
                          (index) {
                            return RadioListTile<int>(
                              title: Text(
                                questions[currentQuestionIndex].options[index],
                                style: const TextStyle(fontSize: 16),
                              ),
                              value: index,
                              groupValue: selectedOptions[currentQuestionIndex],
                              onChanged: (value) {
                                setState(() {
                                  selectedOptions[currentQuestionIndex] = value;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (currentQuestionIndex < questions.length - 1) {
                              currentQuestionIndex++;
                            } else {
                              print(selectedOptions);
                              Navigator.pop(context);
                            }
                          });
                        },
                        child: Text(
                          currentQuestionIndex < questions.length - 1
                              ? 'Next'
                              : 'Finish',
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text('Request'),
    );
  }
}
