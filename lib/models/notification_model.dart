import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

Text renderNotificationContent(
    {required String orderId,
    required NotificationType orderType,
    double price = 0.0}) {
  TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: kPrimaryColor,
  );
  switch (orderType) {
    case NotificationType.arrived:
      return Text.rich(TextSpan(text: 'Order ', children: [
        TextSpan(text: orderId, style: textStyle),
        const TextSpan(
            text:
                ' has been completed & arrived at the destination address ( Please rates your order )')
      ]));
    case NotificationType.success:
      return Text.rich(TextSpan(text: 'Order ', children: [
        TextSpan(text: orderId, style: textStyle),
        const TextSpan(
            text: ' has been Success. Please wait for the product to be sent')
      ]));
    case NotificationType.confirmed:
      return Text.rich(TextSpan(text: 'Payment order ', children: [
        TextSpan(text: orderId, style: textStyle),
        const TextSpan(
            text: ' has been confirmed. Please wait for the product to be sent')
      ]));
    case NotificationType.canceled:
      return Text.rich(TextSpan(text: 'Refunds order ', children: [
        TextSpan(text: orderId, style: textStyle),
        TextSpan(
            text:
                ' have been processed. A fund of \$ $price will be returned in 15 minutes')
      ]));
    default:
  }
  return const Text('');
}

Text renderNotificationTitle({
  required NotificationType orderType,
}) {
  TextStyle textStyle = TextStyle(
    fontSize: getProportionateScreenWidth(16),
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  switch (orderType) {
    case NotificationType.arrived:
      return Text('Order Arrived', style: textStyle);
    case NotificationType.success:
      return Text('Order Success', style: textStyle);
    case NotificationType.confirmed:
      return Text('Payment Confirmed', style: textStyle);
    case NotificationType.canceled:
      return Text('Order Canceled', style: textStyle);
    default:
  }

  return const Text('');
}

enum NotificationType { arrived, success, confirmed, canceled }

class NotificationModel {
  final String orderId, time;
  final double price;
  final NotificationType orderType;

  NotificationModel(
      {required this.orderId,
      required this.time,
      this.price = 0.0,
      required this.orderType});
}

// Demo data for our notifications

List<NotificationModel> demoNotifications = [
  NotificationModel(
      orderId: '24089794727000824',
      time: 'July 20, 2020 (08:00 pm)',
      orderType: NotificationType.arrived),
  NotificationModel(
      orderId: '24089794727000825',
      time: 'July 20, 2020 (08:00 pm)',
      orderType: NotificationType.arrived),
  NotificationModel(
      orderId: '24089794727000826',
      time: 'July 20, 2020 (08:00 pm)',
      orderType: NotificationType.arrived),
  NotificationModel(
      orderId: '24089794727000824',
      time: 'July 20, 2020 (08:00 pm)',
      orderType: NotificationType.success),
  NotificationModel(
      orderId: '24089794727000824',
      time: 'July 20, 2020 (08:00 pm)',
      orderType: NotificationType.confirmed),
  NotificationModel(
      orderId: '24089794727000824',
      time: 'July 20, 2020 (08:00 pm)',
      orderType: NotificationType.canceled,
      price: 120.0),
  NotificationModel(
      orderId: '24089794727000825',
      time: 'July 20, 2020 (08:00 pm)',
      orderType: NotificationType.canceled,
      price: 150.2),
];
