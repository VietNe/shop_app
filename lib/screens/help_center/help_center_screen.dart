import 'package:flutter/material.dart';
import 'package:shop_app/screens/help_center/components/help_center_body.dart';

class HelpCenterScreen extends StatelessWidget {
  static String routeName = "/help_center";

  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center"),
        centerTitle: true,
      ),
      body: const HelpCenterBody(),
    );
  }
}
