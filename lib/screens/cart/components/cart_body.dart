import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/screens/cart/components/shop_item.dart';
import 'package:shop_app/size_config.dart';

class CartBody extends StatefulWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ShopItem(carts: demoCarts, shopName: 'Wanna Store'),
            ShopItem(carts: demoCarts2, shopName: 'Spotz Store'),
            SizedBox(
              height: getProportionateScreenWidth(180),
            )
          ],
        ),
      ),
    );
  }
}
