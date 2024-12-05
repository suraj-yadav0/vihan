import 'package:flutter/material.dart';
import 'package:vihan/View/management_screen/manager_alert_screen.dart';
import 'package:vihan/View/management_screen/manager_home/manager_home_screen.dart';
import 'package:vihan/View/management_screen/manager_map_screen.dart';
import 'package:vihan/utils/colors.dart';

class ManagerNavbarScreen extends StatefulWidget {
  const ManagerNavbarScreen({super.key});

  @override
  State<ManagerNavbarScreen> createState() => _ManagerNavbarScreenState();
}

class _ManagerNavbarScreenState extends State<ManagerNavbarScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ManagerHomeScreen(),
    const ManagerMapScreen(),
    const ManagerAlertScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important),
            label: 'Alert',
          ),
        ],
        selectedItemColor: orangeColor,
        unselectedItemColor: Colors.black,
      ),
      body: _pages[_currentIndex],
    );
  }
}
