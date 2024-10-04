import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  static const jagah = LatLng(37.4233, -122.0848) ;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(initialCameraPosition: CameraPosition(target: jagah
    
    ));
  }
}
