import 'package:flutter/material.dart';
import 'package:shop_app/screens/settings/components/settings_body.dart';
import 'package:shop_app/size_config.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = '/settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: const SettingsBody(),
    );
  }
}
