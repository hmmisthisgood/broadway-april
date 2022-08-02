import 'dart:convert';
import 'dart:io';

import 'package:boilerplate/app/theme.dart';
import 'package:boilerplate/common/util/log.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../common/navigation/nav.dart';

class NotificationWrapper extends StatefulWidget {
  const NotificationWrapper({required this.child});
  final Widget child;
  @override
  _NotificationWrapperState createState() => _NotificationWrapperState();
}

class _NotificationWrapperState extends State<NotificationWrapper> {
  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    playSound: true,
    enableLights: true,
    ledColor: Colors.blue,
  );

  final FlutterLocalNotificationsPlugin localNotif =
      FlutterLocalNotificationsPlugin();

  Future<void> bgHandler(RemoteMessage message) async {
    await Firebase.initializeApp();

    print('Handling a background message ${message.messageId}');

    var data = message.data['payload'];

    _handleNoitifPayload(data);

    ///
  }

  Future<void> initialiseFirebase() async {
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    initialiseFirebase().then((value) {
      /// firebase mesaging init
      initialiseFCM();

      getAndSetFcmToken();

      initLocalNotif();

      ///listening notifications

      FirebaseMessaging.instance.getInitialMessage();
      bggHandler();
      onForegroundMessageListen();
      onBackgroundMessageListened();
      onNotifOpenedFromTerminated();
    });

    super.initState();
  }

  listenRefreshToken() async {
    await FirebaseMessaging.instance.onTokenRefresh.listen((token) {});
  }

  Future<void> getAndSetFcmToken() async {
    final String? token = await FirebaseMessaging.instance.getToken();
    Log.i(token);
  }

  Future<void> initialiseFCM() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }

    try {
      FirebaseMessaging.onBackgroundMessage(bgHandler);
    } catch (e, s) {
      Log.d(e);
      Log.d(s);
    }

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  bggHandler() {
    FirebaseMessaging.onBackgroundMessage((message) async {
      print("push notif received on bg");
      print(message.data);
    });
  }

  initLocalNotif() async {
    await localNotif
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    localNotif.initialize(
        InitializationSettings(
          android: AndroidInitializationSettings("launch_background"),
          iOS: IOSInitializationSettings(
            onDidReceiveLocalNotification:
                (int a, String? b, String? c, String? d) async {
              /// a

              print(a.toString());
              print(b.toString());
              print(c.toString());
              print(d.toString());

              return;
            },
          ),
        ), onSelectNotification: (a) async {
      // catch notification
      Log.e(a);
      print(a);
      if (a != null) {
        parseLocalPayload(a);
      }
    });
  }

  parseLocalPayload(String data) {
    try {
      var _decoded = json.decode(data);

      Log.d(_decoded);

      // PushNotif notifData = PushNotif.fromJson(_decoded);
      // _handleDeepLinking(notifData);

      // print(notifData.isPublic);
    } catch (e) {
      Log.e(e);
    }
  }

  Future<void> onBackgroundMessageListened() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("notification arrived");
      print(message.data);
      _handlePushNotifData(message);
    });
  }

  onNotifOpenedFromTerminated() async {
    try {
      final _message = await FirebaseMessaging.instance.getInitialMessage();
      if (_message != null) {
        print("notification arrived");
        print(_message.data);
      }
      await Future.delayed(Duration(seconds: 2), () {
        _handlePushNotifData(_message);
      });
    } catch (e, s) {
      Log.d(e);
      Log.d(s);
    }
  }

  _handlePushNotifData(RemoteMessage? message) {
    if (message != null) {
      var body = message.data;
      _handleNoitifPayload(body);
    }
  }

  Future<void> onActionSelected(String value) async {
    switch (value) {
      case 'subscribe':
        {
          print(
              'FlutterFire Messaging Example: Subscribing to topic "fcm_test".');
          await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
          print(
              'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.');
        }
        break;
      case 'unsubscribe':
        {
          print(
              'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".');
          await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
          print(
              'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.');
        }
        break;
      case 'get_apns_token':
        {
          if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS) {
            print('FlutterFire Messaging Example: Getting APNs token...');
            String? token = await FirebaseMessaging.instance.getAPNSToken();
            print('FlutterFire Messaging Example: Got APNs token: $token');
          } else {
            print(
                'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.');
          }
        }
        break;
      default:
        break;
    }
  }

  Future<void> onForegroundMessageListen() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("notification arrived");
      print(message.data);

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      ///
      if (notification != null && android != null) {
        Log.i(notification.body);
        var _pay = message.data;

        var payload = json.encode(_pay);

        localNotif.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: 'launch_background',
            ),
          ),
          payload: payload,
        );
      }
    });
  }

  _showDialog() {
    showDialog(
      builder: (context) {
        return Material(
          elevation: 0.0,
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    15,
                  )),
              padding: EdgeInsets.symmetric(vertical: 45, horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Fetching data for you",
                    style: TextStyle(fontSize: 16, color: CustomTheme.darkGray),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      context: Nav.context,
    );
  }

  _handleDeepLinking(notif) async {
    Log.i(notif);
    BuildContext _context = Nav.context;
    // var _repo = RepositoryProvider.of<FeedRepository>(_context);
    _showDialog();

    Navigator.of(_context, rootNavigator: true).pop();
  }

  _handleNoitifPayload(Map data) async {
    Nav.pushNamed(data['routeName']);
    // await _handleDeepLinking(notifData);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
