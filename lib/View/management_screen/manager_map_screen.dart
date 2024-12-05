import 'package:flutter/material.dart';
import 'package:vihan/View/widgets/google_map.dart';
import 'package:vihan/utils/colors.dart';

import '../user_screen/find_route_screen.dart';
import '../user_screen/search_location.dart';

class ManagerMapScreen extends StatefulWidget {
  const ManagerMapScreen({super.key});

  @override
  State<ManagerMapScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<ManagerMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading : IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("V I H A N", style: TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: true,
        backgroundColor: orangeColor,
      ),
      body:  Stack(
        children: [
          // Existing body content remains the same
          const GoogleMapScreen(),
          // Search bar at the top
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchLocation(),
                  ),
                );
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search Location',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Floating action buttons
          Positioned(
            right: 20,
            bottom: 50,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: FloatingActionButton(
                    backgroundColor: orangeColor,
                    onPressed: () {},
                    mini: true,
                    heroTag: 'centerButton',
                    child: const Icon(
                      Icons.adjust_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: FloatingActionButton(
                    backgroundColor: orangeColor,
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
                    child: const Icon(
                      Icons.directions,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom floating buttons (map and directions)
          Positioned(
            left: 20,
            bottom: 50,
            child: SizedBox(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                backgroundColor: orangeColor,
                onPressed: () {},
                mini: true,
                heroTag: 'trafficButton',
                child: const Icon(
                  Icons.traffic,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
