import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/size_config.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        getProportionateScreenHeight(20),
      ),
      child: SafeArea(
        child: Material(
          borderRadius: BorderRadius.circular(35),
          color: const Color(0xFFF9F9F9),
          elevation: 1,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(20),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(12),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Plus Icon.svg',
                    )),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(20),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(8),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Send.svg',
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
