import 'package:flutter/material.dart';
import 'package:login_regist/models/lesson_details.dart';

class LessonButton extends StatelessWidget {
  const LessonButton(
      {super.key, required this.lesson, required this.onSelectLesson});

  final LessonDetail lesson;
  final void Function(LessonDetail lesson) onSelectLesson;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lesson.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const Icon(
                Icons.chevron_right_rounded,
              ),
            ],
          ),
        ),
        onTap: () {
          onSelectLesson(lesson);
        },
      ),
    );
  }
}
