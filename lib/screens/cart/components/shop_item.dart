import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/screens/cart/components/cart_item.dart';
import 'package:shop_app/size_config.dart';

class ShopItem extends StatefulWidget {
  const ShopItem({Key? key, required this.carts, required this.shopName})
      : super(key: key);
  final List<Cart> carts;
  final String shopName;
  @override
  State<ShopItem> createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.shopName,
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: getProportionateScreenHeight(10)),
          ...List.generate(
            widget.carts.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key(widget.carts[index].product.id.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    widget.carts.removeAt(index);
                  });
                },
                background: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg"),
                    ],
                  ),
                ),
                child: CartItem(cart: widget.carts[index]),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
        ],
      ),
    );
  }
}
