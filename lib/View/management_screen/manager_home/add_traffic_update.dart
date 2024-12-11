import 'package:flutter/material.dart';
import 'package:vihan/View/management_screen/manager_home/traffic_updates.dart';
import 'package:vihan/utils/colors.dart';

class AddTrafficUpdateScreen extends StatefulWidget {
  @override
  _AddTrafficUpdateScreenState createState() => _AddTrafficUpdateScreenState();
}

class _AddTrafficUpdateScreenState extends State<AddTrafficUpdateScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _resolutionTimeController =
  TextEditingController();

  // Variables to hold selected incident type and severity
  String? _selectedIncidentType;
  String? _selectedSeverity;

  // Incident types and severity options
  final List<String> _incidentTypes = ['Accident', 'Road Closure', 'Congestion'];
  final List<String> _severityLevels = ['Mild', 'Moderate', 'Severe'];

  // Function to submit the form
  void _submitTrafficUpdate() {
    if (_formKey.currentState!.validate()) {
      // Process the form data
      String location = _locationController.text;
      String resolutionTime = _resolutionTimeController.text;
      String incidentType = _selectedIncidentType!;
      String severity = _selectedSeverity!;

      // Display a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Traffic update added successfully!')),
      );

      // Clear the form after submission
      _formKey.currentState!.reset();
      _locationController.clear();
      _resolutionTimeController.clear();
      setState(() {
        _selectedIncidentType = null;
        _selectedSeverity = null;
      });

      // Add logic to store the data in the backend (e.g., Firebase)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TrafficUpdatesScreen()));}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: orangeColor,
        centerTitle: true,
        title: Text('A D D  U P D A T E', style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Location input field
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Incident type dropdown
              DropdownButtonFormField<String>(
                value: _selectedIncidentType,
                hint: Text('Select Incident Type'),
                items: _incidentTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedIncidentType = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select an incident type';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Severity dropdown
              DropdownButtonFormField<String>(
                value: _selectedSeverity,
                hint: Text('Select Severity'),
                items: _severityLevels.map((String severity) {
                  return DropdownMenuItem<String>(
                    value: severity,
                    child: Text(severity),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedSeverity = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a severity level';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Resolution time input field
              TextFormField(
                controller: _resolutionTimeController,
                decoration: InputDecoration(
                  labelText: 'Expected Resolution Time',
                  hintText: 'e.g. 2 hours',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an expected resolution time';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),

              // Submit button
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50),backgroundColor: orangeColor),
                onPressed: _submitTrafficUpdate,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Submit Traffic Update', style: TextStyle(fontSize: 16,color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _locationController.dispose();
    _resolutionTimeController.dispose();
    super.dispose();
  }
}
