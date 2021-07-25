import 'package:flutter/material.dart';
import 'package:shop_app/screens/otp/components/otp_body.dart';

class OTPScreen extends StatelessWidget {
  static String routeName = "/otp";

  const OTPScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
        centerTitle: true,
      ),
      body: const OTPBody(),
    );
  }
}
