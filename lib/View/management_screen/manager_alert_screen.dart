import 'package:flutter/material.dart';
import 'package:vihan/utils/colors.dart';

class ManagerAlertScreen extends StatelessWidget {
  const ManagerAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: orangeColor,
        title: const Text(
          'A L E R T S',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 6, // You can dynamically adjust the number of alerts
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TrafficConditionCard(
              title: 'Heavy Traffic',
              subtitle: 'Expect delays due to road construction.',
              imagePath: 'assets/images/traffic1.jpg',
            ),
          );
        },
      ),
    );
  }
}

class TrafficConditionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const TrafficConditionCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
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
        trailing:
          Text(
            '1 min ago',
            style: TextStyle(
              fontSize: 14,
              color: orangeColor,
            ),
          ),
      ),
    );
  }
}

