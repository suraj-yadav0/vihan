import 'package:flutter/material.dart';
import 'package:vihan/View/management_screen/manager_alert_screen.dart';
import 'package:vihan/utils/colors.dart';

class TrafficUpdatesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: Text('U P D A T E S',  style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),),
        backgroundColor: orangeColor,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Refresh action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Expanded(
            //       child: TextField(
            //         decoration: InputDecoration(
            //           hintText: 'Search location',
            //           prefixIcon: Icon(Icons.search),
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(8),
            //           ),
            //         ),
            //       ),
            //     ),
            //     IconButton(
            //       icon: Icon(Icons.location_on),
            //       onPressed: () {
            //         // Location selection logic
            //       },
            //     ),
            //   ],
            // ),

            Expanded(
              child: ListView(
                children: [
                  TrafficConditionCard(
                    title: 'Main Street',
                    subtitle: 'Heavy Traffic',
                    imagePath: 'assets/images/traffic_1.jpeg',
                  ),
                  TrafficConditionCard(
                    title: 'Highway 99',
                    subtitle: 'Moderate Traffic',
                    imagePath: 'assets/images/traffic_2.jpeg',
                  ),
                  TrafficConditionCard(
                    title: 'Downtown Avenue',
                    subtitle: 'Clear',
                    imagePath: 'assets/images/traffic_3.jpeg',
                  ),
                  // Add more cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
