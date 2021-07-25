import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.title,
    required this.image,
  }) : super(key: key);
  final String text, image, title;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      Text(
        title,
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: getProportionateScreenWidth(36),
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        text,
        textAlign: TextAlign.center,
      ),
      const Spacer(),
      Image.asset(
        image,
        height: getProportionateScreenHeight(265),
        width: getProportionateScreenWidth(235),
      )
    ]);
  }
}
