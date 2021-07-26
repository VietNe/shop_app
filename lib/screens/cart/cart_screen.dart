import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/components/cart_body.dart';
import 'package:shop_app/screens/cart/components/check_out_card.dart';
import 'package:shop_app/size_config.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
        children: const [
          CartBody(),
          Positioned(bottom: 0, child: CheckoutCard()),
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
            'Your Cart',
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
