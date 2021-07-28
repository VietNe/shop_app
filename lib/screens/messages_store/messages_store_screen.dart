import 'package:flutter/material.dart';
import 'package:shop_app/screens/messages/components/message_item.dart';
import 'package:shop_app/screens/messages_store/components/messages_store_body.dart';

class MessagesStoreScreen extends StatelessWidget {
  static String routeName = "/messages_store";

  const MessagesStoreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MessageArguments agrs =
        ModalRoute.of(context)!.settings.arguments as MessageArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(agrs.sender),
        centerTitle: true,
      ),
      body: MessagesStoreBody(icon: agrs.icon),
    );
  }
}
