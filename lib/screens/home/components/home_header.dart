import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/btn_icon_with_counter.dart';
import 'package:shop_app/screens/home/components/search_field.dart';
import 'package:shop_app/size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconWithCounter(
            svgSrc: 'assets/icons/Cart Icon.svg',
            onTap: () {},
            numberOfItems: 0,
          ),
          IconWithCounter(
            svgSrc: 'assets/icons/Bell.svg',
            onTap: () {},
            numberOfItems: 99,
          )
        ],
      ),
    );
  }
}
