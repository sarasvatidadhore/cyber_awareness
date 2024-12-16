import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

import '../dashboardScreen page/dashboard_screen.dart';

class EmailOTPPage extends StatefulWidget {
  @override
  _EmailOTPPageState createState() => _EmailOTPPageState();
}

class _EmailOTPPageState extends State<EmailOTPPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _isOTPVerified = false;

  get receiverMail => null;


  void _generateAndSendOTP(String email) {
    // Logic to generate and send OTP via email
    // For demonstration purposes, let's assume OTP is sent to the email provided
    print("OTP Sent to $email");
  }

  void _verifyOTP(BuildContext context) {
    if (_otpController.text == "123456") {
      setState(() {
        _isOTPVerified = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid OTP"),
            content: Text("Please enter a valid OTP."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
   );
    }
  }

  // void sendOTP()async {
  //   EmailAuth.sessionName = "Test Session";
  //   var res = await EmailAuth.sendOtp(receiverMail: receiverMail.text);
  //   if (res){}
  // }
  //
  // void verifyOTP() async{
  //   var res = EmailAuth.validate(receiverMail: receiverMail, userOTP: userOTP: _otpController)
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email OTP Verification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _isOTPVerified ? _buildVerificationSuccess() : _buildOTPForm(),
      ),
    );
  }

  Widget _buildOTPForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Enter your email and the OTP sent to your email address.',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 32.0),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
          ),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            _generateAndSendOTP(_emailController.text);
          },
          child: Text('Get OTP via Email'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: _otpController,
          decoration: InputDecoration(
            labelText: 'OTP',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () => _verifyOTP(context),
          child: Text('Verify OTP'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationSuccess() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 64.0,
          ),
          SizedBox(height: 16.0),
          Text(
            'OTP Verified Successfully!',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Navigate to next screen or perform necessary action
            },
            child: Text('Continue'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

//   void _generateAndSendOTP(String text) {}
//
//   _verifyOTP(BuildContext context) {}
// }

// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: Center(
//         child: Text('Welcome to Dashboard!'),
//       ),
//     );
//   }
}
