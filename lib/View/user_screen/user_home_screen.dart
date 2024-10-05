import 'package:flutter/material.dart';
import 'package:vihan/View/google_map.dart';
import 'package:vihan/View/user_screen/find_route_screen.dart';
import 'package:vihan/utils/colors.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
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
          // Background map view pl,aceholder (replace with actual map later)
          const GoogleMapScreen(),
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
                        builder: (context) => const FindRouteScreen(),
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
}
