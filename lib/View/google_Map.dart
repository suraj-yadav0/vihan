import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final locationController = Location();

  static const googleplex = LatLng(28.679079, 77.069710);
  static const mountainVeiw = LatLng(25.758503, 84.148911);

  LatLng? currentPosition;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => await fetchLocation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: googleplex,
          zoom: 14,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('sourceLocation'),
            icon: BitmapDescriptor.defaultMarker,
            position: googleplex,
          ),
          const Marker(
            markerId: MarkerId('destinationLocation'),
            icon: BitmapDescriptor.defaultMarker,
            position: mountainVeiw,
          ),
        },
      ),
    );
  }

  Future<void> fetchLocation() async {
    bool serviceEnabled;
    PermissionStatus permissisonGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    permissisonGranted = await locationController.hasPermission();

    if (permissisonGranted == PermissionStatus.denied) {
      permissisonGranted = await locationController.requestPermission();
      if (permissisonGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation != null && currentLocation.latitude != null) {
        setState(() {
          currentPosition =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });

        print(currentLocation);
      }
    });
  }
}
