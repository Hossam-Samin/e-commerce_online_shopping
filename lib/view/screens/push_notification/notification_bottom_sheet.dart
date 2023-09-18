import 'package:e_commerce/view/constans/app_assets_images/app_assets_images.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationBottomSheet extends StatefulWidget {
  const NotificationBottomSheet({super.key});

  @override
  State<NotificationBottomSheet> createState() =>
      _NotificationBottomSheetState();
}

class _NotificationBottomSheetState extends State<NotificationBottomSheet> {
  String datetime =
      DateFormat("hh:mm a      dd/MM/yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(AppAssets.clothesOnboard),
                ),
                title: Text(
                  message.notification!.title.toString(),
                  style: const TextStyle(fontFamily: "Rubik"),
                ),
                subtitle: Column(children: [
                  Text(message.notification!.body.toString(),
                      style: const TextStyle(fontFamily: "Rubik")),
                  Text(datetime, style: const TextStyle(fontFamily: "Rubik")),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
