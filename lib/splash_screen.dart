import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vihan/View/login_logout/user_or_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const UserOrManager(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                color: Colors.white70,
                image: DecorationImage(
                  image: AssetImage("assets/images/traffic-light.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "Traffic Management App",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}




        // color: Colors.blue,
        // child: const Center(
        //   child: Text(
        //     "Traffic Management",
        //     style: TextStyle(
        //       fontSize: 25,
        //       fontWeight: FontWeight.w700,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),