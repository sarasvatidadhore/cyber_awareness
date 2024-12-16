import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CaseStudyPage(),
  ));
}

class CaseStudyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Case Studies'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                'Cases about Digital Fraud',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Set text color to blue
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FraudTypePage(),
                  ),
                );
              },
              // style: ElevatedButton.styleFrom(
              //   primary: Colors.green, // Set button color to green
              // ),
              child: Text('Case Study Types'),
            ),
          ],
        ),
      ),
    );
  }
}

class FraudTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Case Study Types'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaseDetailsPage(
                      fraudType: 'Email Fraud',
                      description:
                      'Email fraud involves deceptive or malicious emails that trick individuals into revealing sensitive information or making fraudulent payments.',
                      caseStudy: 'Case study 1: Email Fraud Example',
                    ),
                  ),
                );
              },

              child: Text('Email Fraud'),
            ),
            SizedBox(height: 10), // Add space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaseDetailsPage(
                      fraudType: 'Finance Fraud',
                      description:
                      'Finance fraud includes various types of fraudulent activities related to banking, investments, loans, and financial transactions. One common example is investment scams where individuals are promised high returns with little risk, resulting in significant financial losses.',
                      caseStudy: 'Case study 2: Finance Fraud Example',
                      image: 'assets/images/finance_fraud.webp', // Image path
                    ),
                  ),
                );
              },
              // style: ElevatedButton.styleFrom(
              //   primary: Colors.red, // Set button color to red
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.monetization_on), // Add icon for finance fraud
                  SizedBox(width: 8), // Add space between icon and text
                  Text('Finance Fraud'),
                ],
              ),
            ),
            SizedBox(height: 10), // Add space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaseDetailsPage(
                      fraudType: 'Credit Card Fraud',
                      description:
                      'Other fraud encompasses a wide range of fraudulent activities that do not fit into specific categories, including identity theft, online scams, and more.',
                      caseStudy: 'Case study 3: Other Fraud Example',
                    ),
                  ),
                );
              },

              child: Text('Credit Card Fraud'),
            ),
          ],
        ),
      ),
    );
  }
}

class CaseDetailsPage extends StatelessWidget {
  final String fraudType;
  final String description;
  final String caseStudy;
  final String? image; // Add image parameter

  const CaseDetailsPage({
    required this.fraudType,
    required this.description,
    required this.caseStudy,
    this.image, // Initialize image parameter
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Case Study Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (image != null) // Display image if available
              Image.asset(
                image!,
                height: 200,
                fit: BoxFit.cover,
              ),
            Text(
              fraudType,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              caseStudy,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add more details about the case study as needed
          ],
        ),
      ),
    );
  }
}
