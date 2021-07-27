import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

class NumberBadge extends StatelessWidget {
  const NumberBadge({
    Key? key,
    required this.numberOfItems,
  }) : super(key: key);

  final int numberOfItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(21),
      width: getProportionateScreenWidth(21),
      decoration: BoxDecoration(
        color: const Color(0xFFFF4848),
        shape: BoxShape.circle,
        border: Border.all(width: 1.5, color: Colors.white),
      ),
      child: Center(
        child: Text(
          "$numberOfItems",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(7),
            height: 1,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
