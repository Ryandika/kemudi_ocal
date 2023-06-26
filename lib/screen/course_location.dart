import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_regist/main.dart';
import 'package:login_regist/models/location_details.dart';
import 'package:login_regist/screen/map.dart';
import 'package:maps_launcher/maps_launcher.dart';

class CourseLocationScreen extends StatefulWidget {
  const CourseLocationScreen({super.key, required this.course});

  final LocationDetail course;

  @override
  State<CourseLocationScreen> createState() => _CourseLocationScreenState();
}

class _CourseLocationScreenState extends State<CourseLocationScreen> {
  String get locationImage {
    final lat = widget.course.latitude;
    final lng = widget.course.longitude;

    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:%7C$lat,$lng&key=AIzaSyDFN1FVQNU5nIzA1QJjlyuB3MvzxwXFi4A';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.course.place),
          backgroundColor: colorScheme.onPrimary,
          foregroundColor: colorScheme.onPrimaryContainer,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MapScreen(
                      location: widget.course,
                    ),
                  ),
                );
              },
              child: Container(
                height: 300,
                width: width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  ),
                ),
                child: Image.network(
                  locationImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Alamat',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            // for (final course in widget.course.address)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                widget.course.address[0],
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'No Telepon',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                widget.course.address[1],
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 14),
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton.icon(
                onPressed: () => MapsLauncher.launchQuery(
                    widget.course.place),
                icon:const Icon(Iconsax.map_1),
                label: const Text('Lihat lokasi di peta'),
              ),
            ),
          ],
        ));
  }
}
