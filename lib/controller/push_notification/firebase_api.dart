import 'package:e_commerce/view/constans/keys/keys.dart';
import 'package:e_commerce/view/screens/push_notification/notification_bottom_sheet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("Token: $fCMToken");
    FirebaseMessaging.instance
        .getInitialMessage()
        .then(handleBackgroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleBackgroundMessage);
  }

  Future<void> handleBackgroundMessage(RemoteMessage? message) async {
    if (message == null) return;
    navigateKey.currentState?.push(MaterialPageRoute(
      builder: (context) {
        return const NotificationBottomSheet();
      },
    ));
    navigateKey.currentState
        ?.pushNamed("/NotificationBottomSheet", arguments: message);
    print("Title: ${message.notification!.title}");
    print("Body: ${message.notification!.body}");
    print("Payload: ${message.data}");
  }
}
