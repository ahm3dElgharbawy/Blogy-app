import 'dart:developer';

import 'package:blog_app/core/constants/env.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:pusher_client/pusher_client.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late PusherClient pusher;
  late Channel channel;
  List<String> messages = [];
  int userId = 0;

  @override
  void initState() {
    super.initState();

    PusherOptions options = PusherOptions(
      cluster: Env.pusherCluster,
      encrypted: true,
    );

    pusher = PusherClient(
      Env.pusherAppKey,
      options,
      autoConnect: false,
    );

    channel = pusher.subscribe(Env.notificationChannel(userId));

    channel.bind('notification.sent', (event) {
      log(event!.data.toString());
      setState(() {
        messages.add(event.data!);
      });
    });

    pusher.connect();
  }

  @override
  void dispose() {
    pusher.unsubscribe(Env.notificationChannel(userId));
    pusher.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: messages.isEmpty
          ? const Center(
              child: Text('Listening for notifications...'),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(CustomSizes.defaultSpace),
              child: Column(
                children: [
                  ...messages.map(
                    (msg) => ListTile(
                      title: Text(msg),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
