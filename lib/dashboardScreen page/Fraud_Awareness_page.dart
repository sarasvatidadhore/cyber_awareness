import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(MaterialApp(
//     home: FraudAwarenessPage(),
//   ));
// }

class FraudAwarenessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fraud Awareness'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildFraudType(
              title: 'Phishing Scams',
              image: 'assets/images/phishing.png',
              description:
              'Phishing scams involve fraudulent emails, messages, or websites designed to trick individuals into providing sensitive information.',
              url: 'https://infosecawareness.in',
            ),
            SizedBox(height: 30),
            _buildFraudType(
              title: 'Identity Theft',
              image: 'assets/images/theft.jpeg',
              description:
              'Identity theft occurs when someone steals your personal information to commit fraud or other crimes.',
              url: 'https://infosecawareness.in',
            ),
            SizedBox(height: 30),
            _buildFraudType(
              title: 'Online Shopping Fraud',
              image: 'assets/images/online.jpeg',
              description:
              'Online shopping fraud involves fake websites, counterfeit products, or sellers who do not deliver purchased items.',
              url: 'https://infosecawareness.in',
            ),
            SizedBox(height: 30),
            _buildFraudType(
              title: 'Investment Scams',
              image: 'assets/images/investment.jpeg',
              description:
              'Investment scams promise high returns with little risk, often targeting individuals with promises of quick wealth.',
              url: 'https://infosecawareness.com',
            ),
            // Add more fraud types as needed
          ],
        ),
      ),
    );
  }

  Widget _buildFraudType({
    required String title,
    required String image,
    required String description,
    required String url,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.0),
          Text(description),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              _launchURL(url);
            },
            child: Text('Learn More'),
          ),
        ],
      ),
    );
  }

  // Method to launch URL
  void _launchURL(String url) async {
    try {
      await launch(url, forceWebView: false);
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}
