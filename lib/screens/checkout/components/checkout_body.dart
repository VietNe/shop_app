import 'package:flutter/material.dart';
import 'package:shop_app/screens/checkout/components/payment_methods.dart';
import 'package:shop_app/screens/checkout/components/shipping_options.dart';
import 'package:shop_app/screens/checkout/components/your_address.dart';
import 'package:shop_app/screens/checkout/components/your_cart.dart';
import 'package:shop_app/size_config.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const YourCart(),
            SizedBox(height: getProportionateScreenWidth(20)),
            const YourAddress(),
            SizedBox(height: getProportionateScreenWidth(20)),
            const ShippingOptions(),
            SizedBox(height: getProportionateScreenWidth(20)),
            const PaymentMethods(),
            SizedBox(
              height: getProportionateScreenWidth(180),
            )
          ],
        ),
      ),
    );
  }
}
