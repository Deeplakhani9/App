import 'package:app/views/screens/create_site.dart';
import 'package:app/views/screens/login_page.dart';
import 'package:app/views/screens/main_page.dart';
import 'package:app/views/screens/site_page.dart';
import 'package:app/views/screens/task_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'helpers/fcm_helper.dart';
import 'views/screens/home_page.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("===========BACKGROUND===========");
  await Firebase.initializeApp();
  print(message.notification!.title);
  print(message.notification!.body);
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FCMPushNotificationHelper.fcmPushNotificationHelper.getFCMToken();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
    print("ForeGround");
    print(msg.notification!.title!);
    print(msg.notification!.body!);
  });

  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'login_page',
      routes: {
        '/': (context) => HomePage(),
        'login_page': (context) => LoginPage(),
        'main_page': (context) => MainPage(),
        'create_site': (context) => CreateSite(),
        'site_page': (context) => SitePage(),
        'task_page': (context) => TaskPage()
      },
    ),
  );
}
