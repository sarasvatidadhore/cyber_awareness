// import 'package:cyber_awareness_app/additional%20page/Email_auth.dart';
 import 'package:cyber_awareness_app/dashboardScreen%20page/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signin_screen.dart'; // Update the import path here
//import 'dashboard_screen.dart'; // Import DashboardScreen

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Check if the user is already authenticated
    checkAuthStatus();
  }

  void checkAuthStatus() async {
    await Future.delayed(Duration.zero); // Ensure the context is available
    FirebaseAuth auth = FirebaseAuth.instance;
    // Check if a user is already signed in
    if (auth.currentUser != null) {
      // Navigate to the dashboard screen if a user is already signed in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    }
  }

  void launchPhoneCall() async {
    const url = 'tel:+911234567890'; // Replace with your emergency phone number
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 40.0,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/logo2.jpg', // Replace with your image path
                  width: 300,
                  height: 400,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Do you have an emergency?',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: launchPhoneCall,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Call Now',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: navigateToNextPage,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
