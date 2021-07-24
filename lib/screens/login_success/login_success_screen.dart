import 'package:flutter/material.dart';
import 'package:shop_app/screens/login_success/components/login_success_body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  const LoginSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Login Success"),
        centerTitle: true,
      ),
      body: const LoginSuccessBody(),
    );
  }
}
