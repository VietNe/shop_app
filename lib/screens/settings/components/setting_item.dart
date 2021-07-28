import 'package:flutter/cupertino.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingItem extends StatefulWidget {
  SettingItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  bool value;

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(widget.title,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                )),
          ),
          CupertinoSwitch(
            activeColor: kPrimaryColor,
            value: widget.value,
            onChanged: (val) {
              setState(() {
                widget.value = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
