import 'package:flutter/material.dart';
import 'package:shop_app/components/section_title.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int selectedPaymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> paymentMethods = [
      'assets/images/mastercard-2 (2).png',
      'assets/images/visa.png',
      'assets/images/paypal.png',
      'assets/images/google-pay.png',
      'assets/images/apple-pay.png',
      'assets/images/Logo OVO (SVG-240p) .png',
    ];
    return Column(
      children: [
        SectionTitle(
          text: 'Payment Methods',
          btnTitle: 'View All',
          onPress: () {},
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                paymentMethods.length,
                (index) => buildPaymentMethodItem(paymentMethods, index),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }

  Padding buildPaymentMethodItem(List<String> paymentMethods, int index) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              color: index == selectedPaymentMethod
                  ? kPrimaryColor
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: getProportionateScreenHeight(80),
              height: getProportionateScreenHeight(50),
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(paymentMethods[index]),
                ),
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    setState(() {
                      selectedPaymentMethod = index;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
