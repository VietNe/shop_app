import 'package:flutter/material.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, OTPScreen.routeName);
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
