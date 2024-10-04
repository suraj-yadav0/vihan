import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  static const googleplex = LatLng(28.679079, 77.069710);
  static const mountainVeiw = LatLng(25.758503, 84.148911);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: googleplex,
        zoom: 14,
      ),
      markers: {
      const  Marker(markerId: MarkerId('sourceLocation'),
        icon: BitmapDescriptor.defaultMarker,
        ),
      },
    );
  }
}
