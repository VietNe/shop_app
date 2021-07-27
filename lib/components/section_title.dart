import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
      {Key? key,
      required this.text,
      required this.onPress,
      this.btnTitle = 'See more'})
      : super(key: key);

  final String text, btnTitle;
  final GestureTapCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: onPress,
            child: Text(btnTitle),
          ),
        ],
      ),
    );
  }
}
