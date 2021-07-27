import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/notification_model.dart';
import 'package:shop_app/size_config.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.notification,
    required this.index,
  }) : super(key: key);

  final NotificationModel notification;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenHeight(20),
        getProportionateScreenHeight(20),
        getProportionateScreenHeight(20),
        index == demoNotifications.length - 1
            ? getProportionateScreenHeight(20)
            : 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(6)),
              SizedBox(
                width: getProportionateScreenHeight(48),
                height: getProportionateScreenHeight(48),
                child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFECDF),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: renderOrderIcon(orderType: notification.orderType)),
              ),
            ],
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                renderNotificationTitle(orderType: notification.orderType),
                renderNotificationContent(
                  orderId: notification.orderId,
                  orderType: notification.orderType,
                  price: notification.price,
                ),
                Text(notification.time,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      color: const Color(0xFFBBBBBB),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  SvgPicture renderOrderIcon({required NotificationType orderType}) {
    String asset = 'Parcel.svg';
    switch (orderType) {
      case NotificationType.success:
        asset = 'Check mark rounded Copy.svg';
        break;
      case NotificationType.confirmed:
        asset = 'Cash.svg';
        break;
      case NotificationType.canceled:
        asset = 'Close.svg';
        break;
      default:
    }
    return SvgPicture.asset('assets/icons/$asset');
  }
}
