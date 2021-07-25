import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
    this.isForgotPassScreen = false,
  }) : super(key: key);

  final bool isForgotPassScreen;
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
            if (isForgotPassScreen) {
              Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
            } else {
              Navigator.pushNamed(context, SignUpScreen.routeName);
            }
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
