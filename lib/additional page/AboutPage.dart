import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent, // Changing text color
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Digital India Programme',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green, // Changing text color
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'The Digital India programme of the Government of India aims to transform India into a digitally empowered society and knowledge economy. While it has led to an increase and ease of digital payments globally, it has also resulted in a rise in digital fraud cases. Unfortunately, many of these cases go unreported due to the minimal amounts involved and a lack of awareness about the reporting process.',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87, // Changing text color
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Objective',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange, // Changing text color
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'The objective of this platform is to increase public awareness about digital frauds and provide guidance on the legal process and channels available to report such incidents. By encouraging more people to report digital fraud cases, we can better control these crimes and help consumers recover their losses.',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87, // Changing text color
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Solution',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple, // Changing text color
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'This App will serve as a centralized platform connecting the public with the police, providing education on the legal process for reporting digital frauds and offering channels for reporting incidents. By creating an accessible channel for reporting and seeking assistance, we aim to empower individuals to take action against digital frauds and contribute to the vision of a digitized economy.',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87, // Changing text color
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Made by Utkarsh Dubey and Team',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Changing text color
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Team Members:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Changing text color
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Utkarsh Dubey',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87, // Changing text color
              ),
            ),
            Text(
              'Sachin Mewada',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87, // Changing text color
              ),
            ),
            Text(
              'Rameshwar Tarare',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87, // Changing text color
              ),
            ),
            Text(
              'Saket Hadge',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87, // Changing text color
              ),
            ),
            Text(
              'Sarasvati Dadhore',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87, // Changing text color
              ),
            ),
            // Add more team members as needed
          ],
        ),
      ),
      backgroundColor: Colors.grey[200], // Changing background color
    );
  }
}
