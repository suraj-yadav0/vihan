import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vihan/View/widgets/google_map.dart';
import 'package:vihan/utils/colors.dart';

class FindRouteScreen extends StatefulWidget {
  const FindRouteScreen({super.key});

  @override
  State<FindRouteScreen> createState() => _FindRouteScreenState();
}

class _FindRouteScreenState extends State<FindRouteScreen> {
  TextEditingController curLocController = TextEditingController();

  TextEditingController desLocController = TextEditingController();

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Text Fields for Location and Destination
                LocationInputField(
                  label: 'Your Location',
                  controller: curLocController,
                  icons: const Icon(Icons.add_location_outlined),
                ),
                const SizedBox(height: 10),
                LocationInputField(
                  label: 'Choose Destination',
                  controller: desLocController,
                  icons: const Icon(Icons.panorama_fish_eye),
                ),
              ],
            ),
          ),
          // Mode of Transportation Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.directions_car,
                  color: yellowColor,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.motorcycle,
                  color: yellowColor,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.pedal_bike,
                  color: yellowColor,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.directions_walk,
                  color: yellowColor,
                  size: 40,
                ),
              ),
            ],
          ),
          // const SizedBox(height: 10),
          // Placeholder for map area
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(16),
              child: const GoogleMapScreen(),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Icon icons;
  const LocationInputField(
      {super.key, required this.label, required this.controller, required this.icons});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: orangeColor,
      cursorHeight: 20,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: icons,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white),
        ),
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
