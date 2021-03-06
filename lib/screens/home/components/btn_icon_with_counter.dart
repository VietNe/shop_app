import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/number_badge.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class IconWithCounter extends StatelessWidget {
  const IconWithCounter({
    Key? key,
    required this.svgSrc,
    required this.numberOfItems,
    required this.onTap,
  }) : super(key: key);

  final String svgSrc;
  final int numberOfItems;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numberOfItems != 0)
            Positioned(
              top: -3,
              right: -3,
              child: NumberBadge(numberOfItems: numberOfItems),
            ),
        ],
      ),
    );
  }
}
