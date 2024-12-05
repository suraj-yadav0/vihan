import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vihan/View/login_logout/login_screen.dart';
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
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
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
             Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Email Input
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Enter an email';
                  }
                  // Basic email validation
                  bool emailValid = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'
                  ).hasMatch(val);
                  return emailValid ? null : 'Enter a valid email';
                },
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),

              // Password Input
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
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

              // Confirm Password Input
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock_confirm),
                ),
                obscureText: true,
                validator: (val) {
                  if (val != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),

              // Sign Up Button
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Sign Up'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => isLoading = true);
                    
                    try {
                      User? user = await _authService.registerWithEmailPassword(
                        email, 
                        password
                      );
                      
                      if (user != null) {
                        // Navigate to home or profile setup screen
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ProfileSetupScreen(user: user)
                          )
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

              // Error Display
              SizedBox(height: 12),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),

              // Divider
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
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
                  'https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/google_provider_logo.svg',
                  width: 24,
                  height: 24,
                ),
                label: Text('Sign Up with Google'),
                onPressed: () async {
                  setState(() => isLoading = true);
                  
                  try {
                    User? user = await _authService.signInWithGoogle();
                    
                    if (user != null) {
                      // Check if it's a new user
                      bool isNewUser = user.metadata.creationTime == user.metadata.lastSignInTime;
                      
                      if (isNewUser) {
                        // Navigate to profile setup
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ProfileSetupScreen(user: user)
                          )
                        );
                      } else {
                        // Navigate to home screen for existing users
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => UserNavbarScreen(user: user)
                          )
                        );
                      }
                    }
                  } catch (e) {
                    setState(() {
                      error = 'Google Sign-Up failed: ${e.toString()}';
                      isLoading = false;
                    });
                  }
                },
              ),

              // Login Option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Already have an account?'),
                  TextButton(
                    child: Text('Login'),
                    onPressed: () {
                      // Navigate to login screen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen()
                        )
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
