import 'package:flutter/material.dart';
import 'package:shop_app/components/section_title.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/size_config.dart';

class YourCart extends StatelessWidget {
  const YourCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'Your Cart',
          btnTitle: 'View All',
          onPress: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoCarts2.length,
                (index) => Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(20)),
                  child: SizedBox(
                    width: 88,
                    child: AspectRatio(
                      aspectRatio: 0.88,
                      child: Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(10)),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(demoCarts2[index].product.images[0]),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}
