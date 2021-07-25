import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/size_config.dart';

import '../constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.onItemTap,
    required this.selectedIndex,
  }) : super(key: key);

  final Function onItemTap;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Material(
      elevation: 30,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: getProportionateScreenWidth(65),
        width: SizeConfig.screenWidth * 0.8,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15),
            ),
          ],
          borderRadius: BorderRadius.circular(40),
        ),
        child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/Shop Icon.svg",
                      color: selectedIndex == 0
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () {
                      onItemTap(0);
                    }),
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/Heart Icon.svg",
                    color:
                        selectedIndex == 1 ? kPrimaryColor : inActiveIconColor,
                  ),
                  onPressed: () {
                    onItemTap(1);
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/Chat bubble Icon.svg",
                    color:
                        selectedIndex == 2 ? kPrimaryColor : inActiveIconColor,
                  ),
                  onPressed: () {
                    onItemTap(2);
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",
                    color:
                        selectedIndex == 3 ? kPrimaryColor : inActiveIconColor,
                  ),
                  onPressed: () {
                    onItemTap(3);
                  },
                ),
              ],
            )),
      ),
    );
  }
}
