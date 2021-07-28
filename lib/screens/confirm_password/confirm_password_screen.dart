import 'package:flutter/material.dart';
import 'package:shop_app/screens/confirm_password/components/confirm_password_body.dart';

class ConfirmPasswordScreen extends StatelessWidget {
  static String routeName = "/confirm_password";

  const ConfirmPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        centerTitle: true,
      ),
      body: const ConfirmPasswordBody(),
    );
  }
}
