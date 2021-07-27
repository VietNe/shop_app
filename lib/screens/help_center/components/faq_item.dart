import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

class FAQItem extends StatelessWidget {
  const FAQItem({
    Key? key,
    required this.content,
  }) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenHeight(10),
        0,
        getProportionateScreenHeight(10),
        getProportionateScreenHeight(10),
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: SizeConfig.screenWidth - getProportionateScreenWidth(40),
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(10),
          ),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
              color: const Color(0xFFD8D8D8).withOpacity(0.6),
            )),
          ),
          child: Text(content),
        ),
      ),
    );
  }
}
