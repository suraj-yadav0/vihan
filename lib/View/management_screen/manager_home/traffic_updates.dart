import 'package:flutter/material.dart';
import 'package:vihan/View/google_Map.dart';
import 'package:vihan/View/management_screen/manager_home/add_traffic_update.dart';

import '../../../utils/colors.dart';
import 'manager_home_screen.dart';

class TrafficUpdatesScreen extends StatelessWidget {
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
        title: Text('U P D A T E S',style: TextStyle(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search location',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.grey)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Map and Incident List
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Map View
                  Expanded(
                    flex: 3,
                    child: GoogleMapScreen()
                  ),
                  SizedBox(height: 16),

                  // Traffic Incident List
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              TrafficIncidentCard(
                                location: 'Highway 101',
                                type: 'Accident',
                                severity: 'Severe',
                                timeReported: '15 mins ago',
                                status: 'Active',
                              ),
                              TrafficIncidentCard(
                                location: 'Downtown Main St',
                                type: 'Road Closure',
                                severity: 'Moderate',
                                timeReported: '30 mins ago',
                                status: 'Cleared',
                              ),
                              // Add more traffic updates
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        // Add Traffic Update Button
                        ElevatedButton.icon(
                          onPressed: () {
                            // Open form to add new traffic update
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTrafficUpdateScreen()));
                          },
                          icon: Icon(Icons.add,color: Colors.white,),
                          label: Text('Add Traffic Update',style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            minimumSize: Size(double.infinity, 50),
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

            // Traffic Analytics
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildAnalyticsCard(
                    title: 'Avg. Traffic Speed',
                    value: '45 km/h',
                  ),
                  _buildAnalyticsCard(
                    title: 'Roads with Heavy Traffic',
                    value: '12%',
                  ),
                  _buildAnalyticsCard(
                    title: 'Incidents Reported Today',
                    value: '5',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Analytics card widget
  Widget _buildAnalyticsCard({required String title, required String value}) {
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

// Traffic incident card widget
class TrafficIncidentCard extends StatelessWidget {
  final String location;
  final String type;
  final String severity;
  final String timeReported;
  final String status;

  const TrafficIncidentCard({
    Key? key,
    required this.location,
    required this.type,
    required this.severity,
    required this.timeReported,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$type - $severity'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(timeReported),
            Text(status, style: TextStyle(color: status == 'Active' ? Colors.red : Colors.green)),
          ],
        ),
      ),
    );
  }
}