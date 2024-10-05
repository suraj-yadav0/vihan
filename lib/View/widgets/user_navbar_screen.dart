import 'package:flutter/material.dart';
import 'package:vihan/View/user_screen/user_profile_screen.dart';
import 'package:vihan/View/user_screen/user_report_screen.dart';
import '../user_screen/user_home_screen.dart';

class UserNavbarScreen extends StatefulWidget {
  const UserNavbarScreen({super.key});

  @override
  State<UserNavbarScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserNavbarScreen> {
  int currentPage = 0;

  final List<Widget> _pages = [
    const UserHomeScreen(),
    const UserReportScreen(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report_problem_outlined),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
      ),
      body: _pages[currentPage],
    );
  }
}
