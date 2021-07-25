import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_up/components/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/sign_up';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: const SignUpBody(),
    );
  }
}
