import 'package:flutter/material.dart';
import 'package:shop_app/components/section_title.dart';
import 'package:shop_app/models/notification_model.dart';
import 'package:shop_app/screens/notifications/components/notification_item.dart';
import 'package:shop_app/size_config.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SectionTitle(text: 'Your Activity', onPress: () {}),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: demoNotifications.length,
              itemBuilder: (context, index) {
                return NotificationItem(
                    index: index, notification: demoNotifications[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
