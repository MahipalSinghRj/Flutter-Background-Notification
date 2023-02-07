import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_notification/NotificationFunctios.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'InTrac_Key',
            channelKey: 'basic_channel',
            channelName: 'InUnison(InTrac)',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white,
            playSound: true,
            locked: true,
            enableVibration: true)
      ],
      // Channel groups are only visual and are not required
      //channelGroups: [NotificationChannelGroup(channelGroupKey: 'InTrac_Key', channelGroupName: 'Basic group')],
      debug: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Awesome Notification'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initHome(context);
  }

  double _progressValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const Text(
              'It\'s awesome notification',
            ),
            TextButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('Notification sent successfully...');
                  }
                  createNotification();
                },
                child: const Text(
                  "Send Notification",
                  style: TextStyle(fontSize: 18, color: Colors.teal, fontWeight: FontWeight.bold),
                )),
            CircularProgressIndicator(
              backgroundColor: Colors.redAccent,
              valueColor: const AlwaysStoppedAnimation(Colors.green),
              strokeWidth: 5,
              value: _progressValue,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: const Text('Update Progress'),
              onPressed: () {
                setState(() {
                  _progressValue += 0.1;
                  if (_progressValue > 1.0) _progressValue = 0.0;
                });
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
