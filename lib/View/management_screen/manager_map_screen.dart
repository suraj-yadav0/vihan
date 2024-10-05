import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:vihan/Data/const.dart';
import 'package:vihan/View/management_screen/manager_home/manager_find_map_screen.dart';
import 'package:vihan/utils/colors.dart';

class ManagerMapScreen extends StatefulWidget {
  const ManagerMapScreen({super.key});

  @override
  State<ManagerMapScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<ManagerMapScreen> {
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
      appBar: AppBar(
        title: const Text("Vihan"),
        centerTitle: true,
        backgroundColor: orangeColor,
      ),
      body: Stack(
        children: [
          // Background map view placeholder (replace with actual map later)
           currentPosition == null
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
          // Search bar at the top
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.black),
                  SizedBox(width: 10),
                  Text(
                    'Search Location',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Floating action buttons
          Positioned(
            right: 20,
            bottom: 50,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  mini: true,
                  heroTag: 'centerButton',
                  child: const Icon(Icons.center_focus_strong_rounded),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ManagerFindMapScreen(),
                      ),
                    );
                  },
                  mini: true,
                  heroTag: 'directionButton',
                  child: const Icon(Icons.directions),
                ),
              ],
            ),
          ),
          // Bottom floating buttons (map and directions)
          Positioned(
            left: 20,
            bottom: 50,
            child: FloatingActionButton(
              onPressed: () {},
              mini: true,
              heroTag: 'trafficButton',
              child: const Icon(Icons.traffic),
            ),
          ),
          // Top Right floating action button
          Positioned(
            top: 120,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {},
              mini: true,
              heroTag: 'compassButton',
              child: const Icon(
                Icons.arrow_circle_down, // add correct icon of compass
              ),
            ),
          ),
        ],
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
