import 'package:flutter/material.dart';

import 'package:vihan/View/management_screen/manager_home/manager_home_screen.dart';
import 'package:vihan/View/widgets/google_map.dart';
import 'package:vihan/utils/colors.dart';

class AdminRouteOptimizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ManagerHomeScreen()));
          },
          icon:Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: orangeColor,
        centerTitle: true,
        title: Text('OPTIMIZATION',style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.notifications,color: Colors.white,),
              onPressed: () {
                // Show notifications
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown and DateTime Picker
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     DropdownButton<String>(
            //       value: "City",
            //       items: <String>['City 1', 'City 2', 'City 3']
            //           .map((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            //       onChanged: (_) {},
            //     ),
            //     ElevatedButton.icon(
            //       onPressed: () {
            //         // Select date and time
            //       },
            //       icon: Icon(Icons.date_range),
            //       label: Text('Select Date & Time'),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 20),

            // Map View
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: GoogleMapScreen(),
                  ),
                  SizedBox(width: 16),

                  // Route List and Optimization
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // List of Routes
                        Expanded(
                          child: ListView(
                            children: [
                              RouteCard(
                                routeName: 'Route 1',
                                startPoint: 'Location A',
                                endPoint: 'Location B',
                                estimatedTime: '20 mins',
                                status: 'Active',
                              ),
                              RouteCard(
                                routeName: 'Route 2',
                                startPoint: 'Location C',
                                endPoint: 'Location D',
                                estimatedTime: '45 mins',
                                status: 'Delayed',
                              ),
                              // Add more routes
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        // Optimize Button
                        ElevatedButton.icon(
                          onPressed: () {
                            // Trigger route optimization
                          },
                          icon: Icon(Icons.route,color: Colors.white,),
                          label: Text('Optimize Route',style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            minimumSize: Size(double.infinity, 50,),
                            backgroundColor: orangeColor
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Performance Metrics
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPerformanceCard(
                    title: 'Average Travel Time',
                    value: '25 mins',
                  ),
                  _buildPerformanceCard(
                    title: 'Routes Optimized',
                    value: '15',
                  ),
                  _buildPerformanceCard(
                    title: 'Fuel Efficiency',
                    value: '85%',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Performance metric card widget
  Widget _buildPerformanceCard({required String title, required String value}) {
    return Card(
      color: greenColor2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

// Route card widget
class RouteCard extends StatelessWidget {
  final String routeName;
  final String startPoint;
  final String endPoint;
  final String estimatedTime;
  final String status;

  const RouteCard({
    Key? key,
    required this.routeName,
    required this.startPoint,
    required this.endPoint,
    required this.estimatedTime,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: greenColor2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(routeName, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$startPoint to $endPoint'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(estimatedTime),
            Text(status, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
