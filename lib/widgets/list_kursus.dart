import 'package:flutter/material.dart';
import 'package:login_regist/models/location_details.dart';

class ListKursus extends StatelessWidget {
  ListKursus(
      {super.key, required this.course, required this.onSelectCoursePlace});

  final LocationDetail course;
  final void Function(LocationDetail course) onSelectCoursePlace;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              alignment: Alignment.topLeft,
              child: const Text(
                "Lokasi",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              alignment: Alignment.topLeft,
              child: Text(
                course.place,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            )
          ],
        ),
        onTap: () {
          onSelectCoursePlace(course);
        },
      ),
    );
  }
}
      