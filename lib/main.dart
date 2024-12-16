// import 'package:cyber_awareness_app/LoginScreen.dart';
// import 'package:cyber_awareness_app/SplashScreen.dart';
// import 'package:cyber_awareness_app/dashboard_screen.dart';
// import 'package:cyber_awareness_app/login_signup_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// //import 'package:cyber_awareness_app/login_page.dart';
// void main() {
//   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent ));
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cyber Fraud App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: LoginPage(),
//     );
//   }
//
//
//

//}

import 'package:cyber_awareness_app/dashboardScreen%20page/dashboard_screen.dart';
import 'package:cyber_awareness_app/sign_in%20page/theme.dart';
import 'package:cyber_awareness_app/sign_in%20page/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'additional page/local_notification_service.dart';
//import 'package:welcome_screen.dart';
//import 'package:login_signup/theme/theme.dart';
//import 'package:cyber_awareness_app/get_started_view.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home:  WelcomeScreen(),

    );
    // body: const Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisSize.min,
    //     children: [],
    //   ),
    //
    // )
  }


}

