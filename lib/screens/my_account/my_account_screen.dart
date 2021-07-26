import 'package:flutter/material.dart';
import 'package:shop_app/screens/my_account/components/my_account_body.dart';
import 'package:shop_app/size_config.dart';

class MyAccountScreen extends StatelessWidget {
  static String routeName = '/my_account';
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: const MyAccountBody(),
    );
  }
}
