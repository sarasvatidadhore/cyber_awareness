import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
 //import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS App',
      home: SOSPage(),
    );
  }
}
 
class SOSPage extends StatelessWidget {
  // final Location location = Location();

  void sendSOS() async {
    // Get the current location
    // var currentLocation = await location.getLocation();
    // String locationMessage =
    //     "Emergency! My current location is: ${currentLocation.latitude}, ${currentLocation.longitude}";

    // Launch the phone dialer with emergency number
    launch("tel:911");

    // Send location message to designated contacts via SMS or email
    // Example using SMS:
    // sendMessage(locationMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOS Button'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: sendSOS,
          child: Text('SOS'),
        ),
      ),
    );
  }
}
