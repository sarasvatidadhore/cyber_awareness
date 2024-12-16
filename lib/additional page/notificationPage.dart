import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.notification_important),
            title: Text('Notification 1'),
            subtitle: Text('This is the first notification'),
            onTap: () {
              // Add onTap functionality if needed
            },
          ),
          ListTile(
            leading: Icon(Icons.notification_important),
            title: Text('Notification 2'),
            subtitle: Text('This is the second notification'),
            onTap: () {
              // Add onTap functionality if needed
            },
          ),
          // Add more ListTiles for additional notifications
        ],
      ),
    );
  }
}
