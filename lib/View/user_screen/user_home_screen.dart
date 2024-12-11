import 'package:flutter/material.dart';
import 'package:vihan/View/google_map.dart';
import 'package:vihan/View/login_logout/login_screen.dart';
import 'package:vihan/View/user_screen/find_route_screen.dart';
import 'package:vihan/View/user_screen/menu_screen.dart';
import 'package:vihan/View/user_screen/search_location.dart';
import 'package:vihan/View/user_screen/user_profile_screen.dart';
import 'package:vihan/View/user_screen/user_report_screen.dart';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Welcome, User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Home Menu Item
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Optionally, navigate to home or refresh current screen
              },
            ),
            // Find Routes Menu Item
            ListTile(
              leading: const Icon(Icons.directions),
              title: const Text('Find Routes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FindRouteScreen(),
                  ),
                );
              },
            ),
            // Profile Menu Item
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfileScreen(),
                  ),
                );
              },
            ),
            // Report Menu Item
            ListTile(
              leading: const Icon(Icons.report_problem),
              title: const Text('Report Issues'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserReportScreen(),
                  ),
                );
              },
            ),
            // Settings Menu Item
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
            // Logout Menu Item
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Implement logout logic
                _showLogoutConfirmationDialog(context);
              },
            ),
            // Divider and version info
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Version 1.0.0',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
      // Rest of the existing code remains the same
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("V I H A N",
            style: TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: true,
        backgroundColor: orangeColor,
      ),
      body: Stack(
        children: [
           const GoogleMapScreen(),
          // Existing search bar and floating action buttons remain the same
          // (as in the original implementation)
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

  // Logout confirmation dialog
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
               
              //  Navigator.of(context).pop();
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
            ),
          ],
        );
      },
    );
  }
}