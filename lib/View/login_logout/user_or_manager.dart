import 'package:flutter/material.dart';
import 'package:vihan/View/login_logout/login_screen.dart';
import 'package:vihan/View/login_logout/mang_login_screen.dart';
import 'package:vihan/utils/colors.dart';

class UserOrManager extends StatefulWidget {
  const UserOrManager({super.key});

  @override
  State<UserOrManager> createState() => _UserOrManagerState();
}

class _UserOrManagerState extends State<UserOrManager> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.white54,
                  image: DecorationImage(
                    image: AssetImage("assets/images/traffic-jam.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Traffic Management',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  wordSpacing: 2),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Let me know',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: orangeColor,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      child: Text(
                        "User",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: orangeColor,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MangLoginScreen(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      child: Text(
                        "Management",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
