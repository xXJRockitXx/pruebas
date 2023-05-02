import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pruebas/auth/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pruebas/services/notification_services.dart';

import 'modules/modules.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initNotifications();
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const MainPage(),
        "/module_1": (context) => const Module_1(),
        "/module_2": (context) => const Module_2(),
        "/module_3": (context) => const Module_3(),
        "/video_screen": (context) => const VideoScreen(),
      },
      //home: MainPage(),
    );
  }
}