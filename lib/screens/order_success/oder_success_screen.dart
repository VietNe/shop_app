import 'package:flutter/material.dart';
import 'package:shop_app/screens/main/main_screen.dart';
import 'package:shop_app/screens/order_success/components/order_success_body.dart';

class OrderSuccessScreen extends StatelessWidget {
  static String routeName = "/order_success";

  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          title: const Text("Transaction Status"),
          centerTitle: true,
        ),
        body: const OrderSuccessBody(),
      ),
    );
  }
}
