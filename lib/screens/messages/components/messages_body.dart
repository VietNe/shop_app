import 'package:flutter/material.dart';
import 'package:shop_app/screens/messages/components/message_item.dart';
import 'package:shop_app/size_config.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> messages = [
      {
        "sender": "Reclays Store",
        "content": "Please send your address",
        "image": "assets/icons/reclays.svg",
        "count": 2,
        "time": '8:10 am'
      },
      {
        "sender": "Matahari Store",
        "content": "Please send your address",
        "image": "assets/icons/matahari-department-store.svg",
        "count": 3,
        "time": '8:00 am'
      },
      {
        "sender": "Celanese Store",
        "content": "Please send your address",
        "image": "assets/icons/celanese-1.svg",
        "count": 0,
        "time": 'Yesterday'
      },
      {
        "sender": "H&M California",
        "content": "Please send your address",
        "image": "assets/icons/h-m.svg",
        "count": 0,
        "time": 'Yesterday'
      },
      {
        "sender": "Smitty Store",
        "content": "Please send your address",
        "image": "assets/icons/pei-wei-logo-81-1.svg",
        "count": 0,
        "time": 'Yesterday'
      },
      {
        "sender": "Carrefour Store",
        "content": "Please send your address",
        "image": "assets/icons/carrefour-3.svg",
        "count": 0,
        "time": 'Yesterday'
      },
    ];
    return SafeArea(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          if (index == messages.length - 1) {
            return Column(
              children: [
                MessageItem(
                  content: messages[index]['content'],
                  image: messages[index]['image'],
                  sender: messages[index]['sender'],
                  time: messages[index]['time'],
                  numberOfMessage: messages[index]['count'],
                ),
                SizedBox(height: getProportionateScreenWidth(120)),
              ],
            );
          }
          return MessageItem(
            content: messages[index]['content'],
            image: messages[index]['image'],
            sender: messages[index]['sender'],
            time: messages[index]['time'],
            numberOfMessage: messages[index]['count'],
          );
        },
      ),
    );
  }
}
