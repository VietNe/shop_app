import 'package:flutter/material.dart';
import 'package:shop_app/models/product_models.dart';
import 'package:shop_app/screens/details/components/custom_app_bar.dart';
import 'package:shop_app/screens/details/components/details_body.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = '/details';
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      body: Stack(
        children: [
          DetailsBody(product: agrs.product),
          CustomAppBar(rating: agrs.product.rating)
        ],
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
