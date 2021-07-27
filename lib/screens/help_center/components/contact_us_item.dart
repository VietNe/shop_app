import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/size_config.dart';

class ContactUsItem extends StatelessWidget {
  const ContactUsItem({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  final String title, description, icon;
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
        child: Padding(
          padding: EdgeInsets.all(
            getProportionateScreenHeight(10),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: getProportionateScreenHeight(48),
                    height: getProportionateScreenHeight(48),
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFECDF),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: SvgPicture.asset(icon),
                    ),
                  ),
                ],
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(title),
                    Text(description,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(13),
                          color: const Color(0xFFBBBBBB),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
