import 'package:flutter/material.dart';
import 'package:shop_app/screens/profile/components/profile_body.dart';
import 'package:shop_app/size_config.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: const ProfileBody(),
    );
  }
}
