
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:login_regist/models/location_details.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    required this.location,
  });

  final LocationDetail location;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.location.place),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.location.latitude,
            widget.location.longitude,
          ),
          zoom: 16,
        ),
        myLocationEnabled: true,
        markers: {
                Marker(
                    markerId: const MarkerId('m1'),
                    position: _pickedLocation ??
                        // != null ? _pickedLocation! :  //Bisa make cara ini
                        LatLng(
                          widget.location.latitude,
                          widget.location.longitude,
                        )),
              },
      ),
    );
  }
}
