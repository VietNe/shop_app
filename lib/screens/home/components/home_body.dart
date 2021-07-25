import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/categories.dart';
import 'package:shop_app/screens/home/components/discount_banner.dart';
import 'package:shop_app/screens/home/components/home_header.dart';
import 'package:shop_app/screens/home/components/popular_product.dart';
import 'package:shop_app/screens/home/components/special_offers.dart';
import 'package:shop_app/size_config.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(20)),
          const HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(20)),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const DiscountBanner(),
                  const Categories(),
                  SizedBox(height: getProportionateScreenWidth(10)),
                  const SpecialOffers(),
                  SizedBox(height: getProportionateScreenWidth(30)),
                  const PopularProducts(),
                  SizedBox(height: getProportionateScreenWidth(120)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
