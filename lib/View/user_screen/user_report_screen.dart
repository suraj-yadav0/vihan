import 'package:flutter/material.dart';
import 'package:vihan/utils/colors.dart';

class UserReportScreen extends StatefulWidget {
  const UserReportScreen({super.key});

  @override
  State<UserReportScreen> createState() => _UserReportScreenState();
}

class _UserReportScreenState extends State<UserReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: orangeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text input field
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black, // Border color similar to image
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: 'Type here about the situation...',
                      border: InputBorder.none,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.black),
                        onPressed: () {
                          // Handle camera icon action
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.videocam, color: Colors.black),
                        onPressed: () {
                          // Handle video icon action
                        },
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.add_box_outlined,
                            color: Colors.black),
                        onPressed: () {
                          // Handle add attachment icon action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: SizedBox(
                  width: 200,
                  child: Material(
                    color: orangeColor,
                    borderRadius: BorderRadius.circular(10),
                    child: const InkWell(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        child: Center(
                          child: Text(
                            "Send",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
