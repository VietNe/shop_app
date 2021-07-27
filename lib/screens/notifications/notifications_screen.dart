import 'package:flutter/material.dart';
import 'package:shop_app/screens/notifications/components/notifications_body.dart';

class NotificationsScreen extends StatelessWidget {
  static String routeName = "/notifications";

  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: const NotificationsBody(),
    );
  }
}
