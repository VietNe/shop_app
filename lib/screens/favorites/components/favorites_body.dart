import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/product_models.dart';
import 'package:shop_app/size_config.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Row(
          children: [buildLeftProductList(), buildRightProductList()],
        ),
      ),
    );
  }

  Expanded buildRightProductList() {
    return Expanded(
      child: Column(
        children: [
          ...List.generate(
            demoProducts2.length,
            (index) {
              if (index % 2 != 0) {
                return ProductCard(product: demoProducts2[index], isRow: false);
              }

              return SizedBox(
                  height: index == 0 ? getProportionateScreenHeight(50) : 0);
            },
          ),
          SizedBox(height: getProportionateScreenWidth(120)),
        ],
      ),
    );
  }

  Expanded buildLeftProductList() {
    return Expanded(
      child: Column(
        children: [
          ...List.generate(
            demoProducts2.length,
            (index) {
              if (index % 2 == 0) {
                return ProductCard(
                  product: demoProducts2[index],
                  isRow: false,
                );
              }

              return const SizedBox
                  .shrink(); // here by default width and height is 0
            },
          ),
          SizedBox(height: getProportionateScreenWidth(120)),
        ],
      ),
    );
  }
}
