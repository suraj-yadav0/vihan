import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:vihan/Data/const.dart';

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
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await fetchLocation());
  }

  Future<void> initializeMap() async {
    await fetchLocation();
    final coordinates = await fetchPolylinePoints();
    genratepPolyLineFromPoints(coordinates);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPosition == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              initialCameraPosition:  CameraPosition(
                target: currentPosition!,
                zoom: 14,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('currentLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: currentPosition!,
                ),
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
              polylines: Set<Polyline>.of(polylines.values),
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

      //  print(currentLocation);
      }
    });
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polyLinePoints = PolylinePoints();

    final result = await polyLinePoints.getRouteBetweenCoordinates(
      googleApiKey: googleMapsApiKey,
      request: PolylineRequest(
        origin: PointLatLng(googleplex.latitude, googleplex.longitude),
        destination: PointLatLng(mountainVeiw.latitude, mountainVeiw.longitude),
        mode: TravelMode.driving,
       
      ),
    );

    if (result.points.isNotEmpty) {
      return result.points
          .map(
            (point) => LatLng(point.latitude, point.longitude),
          )
          .toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  Future<void> genratepPolyLineFromPoints(
      List<LatLng> polylineCoordinates) async {
    const id = PolylineId('polyline');

    final polyline = Polyline(
        polylineId: id,
        color: Colors.blueAccent,
        points: polylineCoordinates,
        width: 5);

    setState(() {
      polylines[id] = polyline;
    });
  }
}
