import 'package:flutter/material.dart';
import 'package:vihan/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: orangeColor,
      ),
      body: const Center(child: Text('User Profile Screen')),
    );
  }
}

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Issues'),
        backgroundColor: orangeColor,
      ),
      body: const Center(child: Text('Report Issues Screen')),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: orangeColor,
      ),
      body: const Center(child: Text('Application Settings Screen')),
    );
  }
}