import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/home_body.dart';
import 'package:shop_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: HomeBody(),
    );
  }
}
