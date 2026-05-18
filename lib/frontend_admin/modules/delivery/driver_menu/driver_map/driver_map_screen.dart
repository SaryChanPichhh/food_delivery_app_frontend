import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverMapScreen extends StatefulWidget {
  const DriverMapScreen({super.key});

  @override
  State<DriverMapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<DriverMapScreen> {
  // Initial camera position
  // final CameraPosition _initialPosition = const CameraPosition(
  //   target: LatLng(11.5564, 104.9282), // Phnom Penh coordinates
  //   zoom: 14,
  // );

  // Markers
  // final Set<Marker> _markers = {
  //   const Marker(
  //     markerId: MarkerId('phnom_penh'),
  //     position: LatLng(11.5564, 104.9282),
  //     infoWindow: InfoWindow(title: 'Phnom Penh'),
  //     draggable: true,
  //   ),
  // };

  // late GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Google Map')),
      // body: GoogleMap(
      //   initialCameraPosition: _initialPosition,
      //   markers: _markers,
      //   myLocationEnabled: true,
      //   myLocationButtonEnabled: true,
      //   zoomControlsEnabled: true,
      //   onMapCreated: (controller) {
      //     _controller = controller;
      //   },
      // ),
    );
  }
}
