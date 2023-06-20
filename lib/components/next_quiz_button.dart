import 'package:flutter/material.dart';
import 'package:login_regist/main.dart';

class NextButtonQuiz extends StatelessWidget {
  const NextButtonQuiz({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        'Selanjutnya', 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: colorScheme.onPrimaryContainer,
        ),
        textAlign: TextAlign.center,
        
      ),
    );
  }
}