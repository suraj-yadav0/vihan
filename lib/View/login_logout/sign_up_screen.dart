import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vihan/View/login_logout/login_screen.dart';
import 'package:vihan/View/login_logout/profile_screen.dart';
import 'package:vihan/View/widgets/user_navbar_screen.dart';

import 'package:vihan/services/auth_service.dart';
import 'package:vihan/utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passToggle = true;

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String email = '';
  String password = '';
  String error = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // App Logo or Banner
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 125,
                  width: 125,
                  decoration: const BoxDecoration(
                    color: Colors.white54,
                    image: DecorationImage(
                      image: AssetImage("assets/images/traffic-light.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Input
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter an email';
                          }
                          // Basic email validation
                          bool emailValid = RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(val);
                          return emailValid ? null : 'Enter a valid email';
                        },
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      const SizedBox(height: 16),

                      // Password Input
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        validator: (val) {
                          if (val == null || val.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      const SizedBox(height: 16),

                      // Confirm Password Input
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        validator: (val) {
                          if (val != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Sign Up Button
                      ElevatedButton(
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text('Sign Up'),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => isLoading = true);

                            try {
                              User? user =
                                  await _authService.registerWithEmailPassword(
                                      email, password);

                              if (user != null) {
                                // Navigate to home or profile setup screen
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProfileSetupScreen(user: user),
                                  ),
                                );
                              }
                            } catch (e) {
                              setState(() {
                                error = 'Could not sign up: ${e.toString()}';
                                isLoading = false;
                              });
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 12),

                      // Error Display
                      Text(
                        error,
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),

                      // Divider
                    const  Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: const [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('OR'),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                      ),

                      // Google Sign-Up Button
                      OutlinedButton.icon(
                        icon: Image.network(
                          'https://registry.npmmirror.com/@lobehub/icons-static-png/1.8.0/files/dark/google-color.png',
                          width: 24,
                          height: 24,
                        ),
                        label: const Text('Sign Up with Google'),
                        onPressed: () async {
                          setState(() => isLoading = true);

                          try {
                            User? user = await _authService.signInWithGoogle();

                            if (user != null) {
                              bool isNewUser = user.metadata.creationTime ==
                                  user.metadata.lastSignInTime;

                              if (isNewUser) {
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProfileSetupScreen(user: user),
                                  ),
                                );
                              } else {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => UserNavbarScreen(),
                                  ),
                                );
                              }
                            }
                          } catch (e) {
                            setState(() {
                              error =
                                  'Google Sign-Up failed: ${e.toString()}';
                              isLoading = false;
                            });
                          }
                        },
                      ),

                      // Login Option
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                            child: const Text('Login'),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
