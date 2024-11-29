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
      drawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                
                color: orangeColor,
              ),
              child: const Text(
                'VIHAN MENU',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Report'),
              onTap: () {
                // Add navigation or action for Report
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Add navigation or action for Profile
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("V I H A N", style: TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: true,
        backgroundColor: orangeColor,
      ),
      body: Stack(
        children: [
          // Existing body content remains the same
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
                  Icon(Icons.search, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Search Location',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Floating action buttons (existing code remains the same)
          Positioned(
            right: 20,
            bottom: 50,
            child: Column(
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.orange,
                  onPressed: () {},
                  mini: true,
                  heroTag: 'centerButton',
                  child: const Icon(Icons.center_focus_strong_rounded,color: Colors.white,),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  backgroundColor: Colors.orange,
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
                  child: const Icon(Icons.directions, color: Colors.white,),
                ),
              ],
            ),
          ),
          // Bottom floating buttons (map and directions)
          Positioned(
            left: 20,
            bottom: 50,
            child: FloatingActionButton(
                backgroundColor: Colors.orange,
              onPressed: () {},
              mini: true,
              heroTag: 'trafficButton',
              child: const Icon(Icons.traffic,color : Colors.white),
            ),
          ),
          // Top Right floating action button
          Positioned(
            top: 120,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () {},
              mini: true,
              heroTag: 'compassButton',
              child: const Icon(
                Icons.arrow_circle_down, // add correct icon of compass
             color: Colors.white, ),
            ),
          ),
        ],
      ),
    );
  }
}