import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/components/check_out_card.dart';
import 'package:shop_app/screens/checkout/components/checkout_body.dart';
import 'package:shop_app/size_config.dart';

class CheckoutScreen extends StatelessWidget {
  static String routeName = '/checkout';
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight,
            child: const CheckoutBody(),
          ),
          const Positioned(
              bottom: 0,
              child: CheckoutCard(
                isCheckoutScreen: true,
              )),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: getProportionateScreenWidth(100),
      title: Column(
        children: [
          const Text(
            'Checkout',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Text(
            '4 items',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
