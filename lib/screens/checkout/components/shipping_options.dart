import 'package:flutter/material.dart';
import 'package:shop_app/components/section_title.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class ShippingOptions extends StatelessWidget {
  const ShippingOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'Shipping Options',
          btnTitle: 'Choose Service',
          onPress: () {},
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Row(
            children: [
              SizedBox(
                width: getProportionateScreenHeight(70),
                height: getProportionateScreenHeight(50),
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: 'Fedex',
                    child: Image.asset('assets/images/fedex-express.png'),
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '\$131.18',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Will be received on July 12, 2020',
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
