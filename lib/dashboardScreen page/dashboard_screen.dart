//  to add some profile feature so then again write code here
//import 'dart:html';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cyber_awareness_app/additional%20page/LessonSubmissionPage.dart';
import 'package:cyber_awareness_app/additional%20page/chatbot.dart';
import 'package:cyber_awareness_app/additional%20page/logoutpage.dart';

//import //'package:cyber_awareness_app/sign_in%20page/SP.dart';
import 'package:flutter/material.dart';
import 'package:cyber_awareness_app/additional%20page/case_study_page.dart';
import 'package:cyber_awareness_app/additional%20page/notificationPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cyber_awareness_app/additional%20page/item_News_Feed.dart';
import 'package:cyber_awareness_app/additional%20page/item_service.dart';
import 'package:cyber_awareness_app/sign_in%20page/signin_screen.dart';

import 'Fraud_complaint.dart';
import 'Fraud_Awareness_page.dart';
import '../additional page/AboutPage.dart';
import '../additional page/SettingsPage.dart';
import '../additional page/HelpPage.dart';
import '../additional page/ProfilePage.dart';
//import 'ChatScreen.dart';
import '../additional page/FeedbackForm.dart';
import '../additional page/demo.dart';
import '../additional page/local_notification_service.dart';
// import 'package:cyber_awareness_app/Email_auth.dart';
//import 'package:cyber_awareness_app/sharedlesson.dart.';
import 'SharedLessonPage.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  // Function to start a phone call
  void _startPhoneCall() async {
    const phoneNumber = '1930'; // Specify the phone number to call
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
    // Code for making a phone call
  }

  // Function to send an SMS
  Future<void> _sendSMS() async {
    const phoneNumber = '1234567890'; // Specify the phone number to send the SMS
    const message = 'This is a test message from Cyber App.';
    // final url = 'sms:$phoneNumber?body=$message';
    //
    // if (await canLaunch(url)) {
    // await launch(url);
    // } else {
    // throw 'Could not launch $url';
    // }// Message to be sent

    // Create an SmsMessage instance
    //final smsMessage = SmsMessage(phoneNumber, message);

    // Send the; SMS
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'Cyber App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationPage(), // Replace NotificationPage with the actual page
                ),
              );
            },
            icon: Icon(Icons.notifications_none_sharp),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage:
                    AssetImage('assets/images/profile.png'), // Change with user's profile picture
                    radius: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Utkarsh Dubey', // Change with user's name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ),
                );
                // About page onPressed action
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
                // Settings page onPressed action
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpPage(),
                  ),
                );
                // Help page onPressed action
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Feedback'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedbackForm(),
                  ),
                );
                // Feedback form onPressed action
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
                  ),
                );
                // Feedback form onPressed action
              },
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 100, left: 15, right: 15, bottom: 30),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(text: 'Hi,'),
                          TextSpan(
                            text: ' This is Cyber Portal ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage:
                      AssetImage('assets/images/profile.png'),
                      radius: 25,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  'Do you have an emergency?',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  'Now you can contact us in case of any emergency. You can call or message just by pressing button below.',
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w300,
                      height: 1.5),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _startPhoneCall,
                        label: const Text('Call Now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                        ),
                        icon: const Icon(Icons.call),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                ListTile(
                  title: Text(
                    'Our Services',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView(
                    padding: const EdgeInsets.only(
                        top: 5, left: 5, right: 5, bottom: 10),
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FraudComplaintPage(),
                            ),
                          );
                        },
                        child: ItemService(
                            title: 'Complaint\n Digital Fraud',
                            image: 'assets/images/Report.png'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FraudAwarenessPage(),
                            ),
                          );
                        },
                        child: ItemService(
                            title: 'Digital  \n Fraud Awareness ',
                            image: 'assets/images/prevention.png'),
                      ),
                      GestureDetector(
                        onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (contex)=>LessonUploadPage()));
                        },
                        child: ItemService(
                            title: 'learn \n lesson',
                            image: 'assets/images/lesson.png'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                ListTile(
                  title: Text(
                    'News Feed',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Column(
                  children: [
                    ItemNewsFeed(
                        title:
                        'Bengaluru IT firm CEO loses Rs 2.3 crore in courier fraud:',
                        image: 'assets/images/news1.png',
                          url: 'https://economictimes.indiatimes.com/?back=1s',
                    ),
                    ItemNewsFeed(
                        title:
                        'What KYC fraud and how to stay safe from this scam:',
                        image: 'assets/images/news3.png', url: 'https://economictimes.indiatimes.com/?back=1s',),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatBot(),
            ),
          );
        },
        child: Icon(Icons.chat),
      ),
    );
  }
}

class ItemService extends StatelessWidget {
  final String title;
  final String image;

  const ItemService({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 80,
            width: 80,
          ),
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
