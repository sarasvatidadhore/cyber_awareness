import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Help',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent, // Changing text color
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'If you need any assistance or have any questions',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87, // Changing text color
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'please feel free to reach out to us at:',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87, // Changing text color
                    ),
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      _launchEmail('utkarshdubey1303@gmail.com');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.email, color: Colors.green),
                        // Adding email icon
                        SizedBox(width: 10.0),
                        Text(
                          'Email: utkarshdubey1303@gmail.com',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87, // Changing text color
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      _launchPhone('+91 8358881292');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.phone, color: Colors.green),
                        // Adding phone icon
                        SizedBox(width: 10.0),
                        Text(
                          'Phone: +91 8358881292',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87, // Changing text color
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to launch email
  void _launchEmail(String email) async {
    String url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchPhone(String s) {}

}
