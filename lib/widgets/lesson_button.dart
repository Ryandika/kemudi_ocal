import 'package:flutter/material.dart';
import 'package:login_regist/data/details.dart';
import 'package:login_regist/models/lesson_details.dart';
import 'package:login_regist/screen/lesson_detail.dart';


class LessonButton extends StatelessWidget {
  const LessonButton({super.key, required this.lesson, required this.onSelectLesson});


final LessonDetail lesson;
final void Function(LessonDetail lesson) onSelectLesson;

  @override
  Widget build(BuildContext context) {
    return Card(
                elevation: 5,
                child: InkWell(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Pelajaran",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        alignment: Alignment.topLeft,
                        child: Text(
                          lesson.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    onSelectLesson(lesson);
                  },
                ),
              );
  }
}