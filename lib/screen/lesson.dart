import 'package:flutter/material.dart';
import 'package:login_regist/data/details.dart';
import 'package:login_regist/models/lesson_details.dart';
import 'package:login_regist/widgets/lesson_button.dart';
import 'lesson_detail.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({
    super.key,
    // required this.lessons,
  });

  // final List<LessonDetail> lessons;

  void selectLesson(BuildContext context, LessonDetail lesson) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => LessonDetailsScreen(
              lesson: lesson,
            )));
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width; //-ngatur width sesuai lebar screen
    Widget content = ListView.builder(
      itemCount: details.length,
      itemBuilder: (ctx, index) => LessonButton(
        lesson: details[index],
        onSelectLesson: (lesson) {
          selectLesson(context, lesson);
        },
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelajaran'),
        centerTitle: true,
        // foregroundColor: Colors.black,
        // backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: content,
      ),
    );
  }
}
