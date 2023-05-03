import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:pruebas/auth/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pruebas/services/notification_services.dart';
import 'package:pruebas/pedometer/step_counter.dart';
import 'modules/modules.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initNotifications();
  await initservice();
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

Future<void> initservice()async{
  var service=FlutterBackgroundService();

  //service init and start
  await service.configure(
      iosConfiguration: IosConfiguration(
          onBackground: iosBackground,
          onForeground: onStart
      ),
      androidConfiguration: AndroidConfiguration(
          onStart: onStart,
          autoStart: true,
          isForegroundMode: true,
      )
  );
  service.startService();
  //for ios enable background fetch from add capability inside background mode
}

//onstart method
@pragma("vm:enry-point")
void onStart(ServiceInstance service){
  DartPluginRegistrant.ensureInitialized();

  service.on("setAsForeground").listen((event) {
    print("foreground ===============");
  });

  service.on("setAsBackground").listen((event) {
    print("background ===============");
  });

  service.on("stopService").listen((event) {
    service.stopSelf();
  });

  print("Background service ${DateTime.now()}") ;

}

//iosbackground
@pragma("vm:enry-point")
Future<bool> iosBackground(ServiceInstance service)async{
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  return true;
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
        //"/video_screen": (context) => const VideoScreen(),
        "/step_counter": (context) => const StepCounter(),
      },
      //home: MainPage(),
    );
  }
}