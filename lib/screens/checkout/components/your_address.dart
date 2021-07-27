import 'package:flutter/material.dart';
import 'package:shop_app/components/section_title.dart';
import 'package:shop_app/size_config.dart';

class YourAddress extends StatelessWidget {
  const YourAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          text: 'Your Addres',
          btnTitle: 'Edit Address',
          onPress: () {},
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: const Text('Jimmy Sullivan, (+1) 954-868-1190'),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: const Text('Long Beach, California (Jimmy’s Home), 90712'),
        ),
      ],
    );
  }
}
