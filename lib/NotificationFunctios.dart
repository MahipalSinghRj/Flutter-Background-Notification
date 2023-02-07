

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> createNotification()async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id:createScheduledNotification(),
        channelKey: "basic_channel",
        title: Emojis.money_money_bag+Emojis.plant_cactus,
        body: 'InTrac is a canada based project',
        bigPicture: 'asset://assets/nointernet.png',
        notificationLayout: NotificationLayout.BigPicture
      )
  );
}

int createScheduledNotification()   {
return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

 onNotificationCreatedMethod(ReceivedNotification receivedNotification,  BuildContext context) async {
  // Your code goes here
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Notification created on ${receivedNotification.channelKey}"),
      )
  );
}

initHome(BuildContext context){
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (isAllowed) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Allow Notification"),
            content: const Text('Our app would like to send you notification'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Don't Allow",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: TextButton(
                  onPressed: () => AwesomeNotifications().requestPermissionToSendNotifications().then((value) {
                    Navigator.pop(context);
                    if (kDebugMode) {
                      print("Allowed");
                    }
                  }),
                  child: const Text(
                    "Allow",
                    style: TextStyle(fontSize: 18, color: Colors.teal, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ));
    }
  });
}



