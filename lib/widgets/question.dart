import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {super.key,
      required this.question,
      required this.indexAction,
      required this.totalQuestion});

  final String question;
  final int indexAction;
  final int totalQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Pertanyaan ${indexAction + 1} / $totalQuestion :',
          style: const TextStyle(
            fontSize: 20, 
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
    const SizedBox(height: 10),
         Text(
          question,
          style: const TextStyle(
            fontSize: 18, 
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}