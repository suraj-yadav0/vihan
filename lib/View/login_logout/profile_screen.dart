import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vihan/View/user_screen/user_home_screen.dart';

class ProfileSetupScreen extends StatefulWidget {
  final User user;
  
  ProfileSetupScreen({required this.user});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _profileFormKey = GlobalKey<FormState>();
  String username = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complete Your Profile')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _profileFormKey,
          child: ListView(
            children: <Widget>[
              // Username Input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Choose a username';
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() => username = val);
                },
              ),

              // Phone Number Input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number (Optional)',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                onChanged: (val) {
                  setState(() => phoneNumber = val);
                },
              ),

            const  SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Complete Profile'),
                onPressed: () async {

                   Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const UserHomeScreen(),
                      )
                    );
                  // if (_profileFormKey.currentState!.validate()) {
                  //   // Save additional user profile information
                  //   // You can use Firestore to store extra user details
                  //   await FirebaseFirestore.instance
                  //     .collection('users')
                  //     .doc(widget.user.uid)
                  //     .set({
                  //       'username': username,
                  //       'email': widget.user.email,
                  //       'phoneNumber': phoneNumber ?? '',
                  //       'createdAt': FieldValue.serverTimestamp(),
                  //     });

                  //   // Navigate to home screen
                   
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}