import 'package:flutter/material.dart';
import 'package:vihan/View/google_map.dart';
import 'package:vihan/View/management_screen/manager_map_screen.dart';
import 'package:vihan/View/user_screen/user_report_screen.dart';
import 'package:vihan/utils/colors.dart';

class ManagerHomeScreen extends StatefulWidget {
  const ManagerHomeScreen({super.key});

  @override
  State<ManagerHomeScreen> createState() => _ManagerHomeScreenState();
}

class _ManagerHomeScreenState extends State<ManagerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.menu, color: Colors.white),
        //   onPressed: () {
        //     Scaffold.of(context).openDrawer(); // Open the drawer
        //   },
        // ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: orangeColor,
        title: const Text(
          'D A S H B O A R D',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
     
      drawer: _buildDrawer(), // Adding the Drawer
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ManagerMapScreen(),
                        ),
                      );
                    },
                    child: const GoogleMapScreen(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              // Add your functionality for Traffic Updates
                            },
                            child: buildCategoryIcon(
                              context,
                              'Traffic Updates',
                              Icons.traffic,
                            ),
                          ),
                          const SizedBox(width: 15),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const UserReportScreen(),
                                ),
                              );
                            },
                            child: buildCategoryIcon(
                                context, 'Incident Reporting', Icons.report_problem),
                          ),
                          const SizedBox(width: 15),
                          InkWell(
                            onTap: () {
                              // Add your functionality for Route Optimization
                            },
                            child: buildCategoryIcon(
                                context, 'Route Optimization', Icons.alt_route),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Traffic Conditions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        buildTrafficConditionCard(
                          context,
                          'Heavy Traffic on 101 South',
                          '17 min delay',
                          'assets/images/traffic1.jpg',
                        ),
                        buildTrafficConditionCard(
                          context,
                          'Accident on 280 North',
                          'Avoid area near San Bruno Ave',
                          'assets/images/traffic2.jpg',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Drawer Widget
  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: orangeColor),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Map'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ManagerMapScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.traffic),
            title: const Text('Traffic Updates'),
            onTap: () {
              // Add Traffic Updates functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.report_problem),
            title: const Text('Incident Reports'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserReportScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Add Settings functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Handle Logout functionality
            },
          ),
        ],
      ),
    );
  }

  Widget buildCategoryIcon(
      BuildContext context, String title, IconData iconData) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.orange,
          child: Icon(iconData, size: 30, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildTrafficConditionCard(
      BuildContext context, String title, String subtitle, String imagePath) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
