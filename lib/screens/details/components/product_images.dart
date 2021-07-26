import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/product_models.dart';
import 'package:shop_app/size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.id.toString(),
              child: Image.asset(widget.product.images[selectedImage]),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images.length,
                (index) => buildSmallProductPreview(index)),
          ],
        ),
      ],
    );
  }

  Row buildSmallProductPreview(int index) {
    return Row(
      children: [
        Stack(
          children: [
            AnimatedContainer(
              duration: defaultDuration,
              padding: const EdgeInsets.all(8),
              height: getProportionateScreenWidth(48),
              width: getProportionateScreenWidth(48),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: kPrimaryColor
                        .withOpacity(index == selectedImage ? 0.5 : 0)),
              ),
              child: Image.asset(widget.product.images[index]),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    setState(() {
                      selectedImage = index;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        if (index != widget.product.images.length - 1)
          const SizedBox(width: 15),
      ],
    );
  }
}
