import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:login_regist/data/courses.dart';
import 'package:login_regist/models/location_details.dart';
import 'package:login_regist/screen/course_location.dart';
import '../widgets/list_kursus.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  List<LocationDetail> _foundLocation = [];

  @override
  void initState() {
    _foundLocation = courses;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<LocationDetail> results = [];
    if (enteredKeyword.isEmpty || enteredKeyword == '') {
      // if the search field is empty or only contains white-space, we'll display all users
      results = courses;
    } else {
      results = courses
          .where((location) => location.place
              .trim()
              .toLowerCase()
              .contains(enteredKeyword.trim().toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive

      setState(() {
        _foundLocation = results;
      });
    }
  }

  void _getCurrentLocation() async {
    setState(() {
    });

    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }


    setState(() {
    });

  }

  void selectCoursePLace(BuildContext context, LocationDetail course) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => CourseLocationScreen(
              course: course,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: _foundLocation.length,
      itemBuilder: (ctx, index) => ListKursus(
        course: _foundLocation[index],
        onSelectCoursePlace: (course) {
          selectCoursePLace(context, course);
        },
      ),
    );

    // if (_isGettingLocation) {
    //   content = const Center(child: CircularProgressIndicator());
    // }

    return Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (value) => _runFilter(value),
            decoration: const InputDecoration(
              hintText: 'Cari Lokasi Kursus...',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: SizedBox(
              //     width: double.infinity,
              //     child: ElevatedButton.icon(
              //       icon: const Icon(Icons.sort),
              //       label: const Text('Sort by nearest from my location'),
              //       onPressed: _getCurrentLocation,
              //     ),
              //   ),
              // ),
        
              const SizedBox(
                height: 14,
              ),
              Expanded(
                child: _foundLocation.isNotEmpty
                    ? content
                    : const Text(
                        'Pencarian tidak ditemukan.',
                        textAlign: TextAlign.center,
                      ),
              ),
            ],
          ),
        ));
  }
}
