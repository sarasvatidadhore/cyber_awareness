import 'package:flutter/material.dart';
import 'package:cyber_awareness_app/sign_in%20page/signin_screen.dart'; // Import your sign-in screen widget

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showLogoutConfirmationDialog(context);
          },
          child: Text('Logout'),
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()), // Replace SignInScreen() with your actual sign-in screen widget
                );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
