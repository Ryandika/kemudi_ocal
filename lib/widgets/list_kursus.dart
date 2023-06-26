import 'package:flutter/material.dart';
import 'package:login_regist/models/location_details.dart';

class ListKursus extends StatelessWidget {
  const ListKursus(
      {super.key, required this.course, required this.onSelectCoursePlace});

  final LocationDetail course;
  final void Function(LocationDetail course) onSelectCoursePlace;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Lokasi",
                  style: TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 14),
                ),
                const SizedBox(height: 14,),
                Text(
                  course.place,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            )),
        onTap: () {
          onSelectCoursePlace(course);
        },
      ),
    );
  }
}
