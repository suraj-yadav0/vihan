import 'package:flutter/material.dart';
import 'package:vihan/utils/colors.dart';

class ManagerFindMapScreen extends StatelessWidget {
  const ManagerFindMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        elevation: 0,
        title: const Text('Find Route', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Text Fields for Location and Destination
                LocationInputField(label: 'Your Location'),
                SizedBox(height: 10),
                LocationInputField(label: 'Choose Destination'),
              ],
            ),
          ),
          // Mode of Transportation Icons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TransportIcon(
                  icon: Icons.directions_car,
                  label: 'Car',
                  onTap: () {},
                ),
                TransportIcon(
                  icon: Icons.motorcycle,
                  label: 'Motorcycle',
                  onTap: () {},
                ),
                TransportIcon(
                  icon: Icons.pedal_bike,
                  label: 'Bicycle',
                  onTap: () {},
                ),
                TransportIcon(
                  icon: Icons.directions_walk,
                  label: 'Walk',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Placeholder for map area
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(16),
              child: const Center(child: Text('Map View')),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationInputField extends StatelessWidget {
  final String label;
  const LocationInputField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        fillColor: Colors.grey[200],
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}

class TransportIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const TransportIcon(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.purple),
          Text(label),
        ],
      ),
    );
  }
}
