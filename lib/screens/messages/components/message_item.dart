import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/number_badge.dart';
import 'package:shop_app/screens/messages_store/messages_store_screen.dart';
import 'package:shop_app/size_config.dart';

class MessageArguments {
  final String sender;
  final String icon;

  MessageArguments({
    required this.sender,
    required this.icon,
  });
}

class MessageItem extends StatelessWidget {
  const MessageItem({
    Key? key,
    required this.sender,
    required this.content,
    required this.image,
    required this.time,
    required this.numberOfMessage,
  }) : super(key: key);

  final String sender, content, image, time;
  final int numberOfMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(10),
        getProportionateScreenWidth(10),
        getProportionateScreenWidth(10),
        0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            MessagesStoreScreen.routeName,
            arguments: MessageArguments(sender: sender, icon: image),
          );
        },
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          child: Row(
            children: [
              SizedBox(
                width: getProportionateScreenHeight(70),
                height: getProportionateScreenHeight(70),
                child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(18)),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: SvgPicture.asset(image)),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sender,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(16),
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      content,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(time),
                  if (numberOfMessage > 0)
                    NumberBadge(numberOfItems: numberOfMessage),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
