import 'package:flutter/material.dart';
import 'package:login_regist/data/courses.dart';
import 'package:login_regist/models/location_details.dart';
import 'package:login_regist/screen/course_location.dart';
import '../widgets/list_kursus.dart';

class FindPage extends StatelessWidget {
  const FindPage({super.key});

  void selectCoursePLace(BuildContext context, LocationDetail course) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => CourseLocationScreen(
              course: course,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: courses.length,
      itemBuilder: (ctx, index) => ListKursus(
        course: courses[index],
        onSelectCoursePlace: (course) {
          selectCoursePLace(context, course);
        },
      ),
    );

    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
          title: Container(
        // Add padding around the search bar
        // padding: const EdgeInsets.symmetric(horizontal: 8.0),
        // Use a Material design search bar
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Cari Lokasi Kursus...',
            // Add a clear button to the search bar
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.clear,
                color: Colors.black,
              ),
              onPressed: () => searchController.clear(),
            ),
            // Add a search icon or button to the search bar
            prefixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                // Perform the search here
              },
            ),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(20.0),
            // ),
          ),
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: content,
      ),
    );
  }
}
