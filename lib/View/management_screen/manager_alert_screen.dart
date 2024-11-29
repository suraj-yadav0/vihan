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
          return const TrafficAlertCard();
        },
      ),
    );
  }
}

// Widget for individual Traffic Alert Card
class TrafficAlertCard extends StatelessWidget {
  const TrafficAlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Placeholder for image
            Container(
              width: 60,
              height: 60,
              color: Colors.purple[100],
              child: const Icon(Icons.image, color: Colors.purple, size: 40),
            ),
            const SizedBox(width: 16),
            // Text description
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Heavy Traffic on 101 South',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '1 min ago',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Icon for location
            Icon(
              Icons.location_on,
              color: Colors.green[700],
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
