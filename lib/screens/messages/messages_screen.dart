import 'package:flutter/material.dart';
import 'package:shop_app/screens/messages/components/messages_body.dart';

class MessagesScreen extends StatelessWidget {
  static String routeName = "/messages";

  const MessagesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        centerTitle: true,
      ),
      body: const MessagesBody(),
    );
  }
}
