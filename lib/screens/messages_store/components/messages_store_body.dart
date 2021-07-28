import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/messages_store/components/chat_input_field.dart';
import 'package:shop_app/size_config.dart';

const image =
    'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZHVjdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80';

class MessagesStoreBody extends StatelessWidget {
  const MessagesStoreBody({Key? key, required this.icon}) : super(key: key);
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              SizedBox(height: getProportionateScreenWidth(20)),
              const Message(isLeft: false, content: 'Morning Reclays! 🙂'),
              const Message(
                  isLeft: false,
                  content:
                      'Just want to tell you, I just want to make a change 😀😃'),
              const Message(
                  isLeft: false, content: '', image: image, isHaveTime: true),
              SizedBox(height: getProportionateScreenWidth(20)),
              Message(
                  icon: icon,
                  content: 'Hey, how\'s it going? What did you do today?'),
              Message(
                  icon: icon,
                  content:
                      'Just walked my doge. She was super duper cute. The best pupper!!'),
              Message(
                  icon: icon,
                  content: 'Please send your address, and your code ',
                  isHaveTime: true),
              SizedBox(height: getProportionateScreenWidth(20)),
              const Message(
                  isLeft: false,
                  content: 'Nice! What kind of food did you eat? 🙂',
                  isHaveTime: true),
              SizedBox(height: getProportionateScreenWidth(20)),
              const Message(content: 'Ok!'),
              Message(
                  icon: icon,
                  content: 'I ate so much food today.',
                  isHaveTime: true),
              SizedBox(height: getProportionateScreenWidth(20)),
              const Message(
                  isLeft: false, content: '😅 😂 🤣', isHaveTime: true),
              SizedBox(height: getProportionateScreenWidth(20)),
            ],
          ),
        ),
        const ChatInputField(),
      ],
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    Key? key,
    this.isHaveTime = false,
    this.isLeft = true,
    this.icon = '',
    required this.content,
    this.image = '',
  }) : super(key: key);
  final bool isHaveTime, isLeft;
  final String content, image, icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(0),
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(10)),
      child: Row(
        textDirection: isLeft ? TextDirection.ltr : TextDirection.rtl,
        children: [
          if (isHaveTime && isLeft)
            SizedBox(
              width: getProportionateScreenHeight(45),
              height: getProportionateScreenHeight(45),
              child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SvgPicture.asset(icon)),
            ),
          if (!isHaveTime && isLeft)
            SizedBox(
              width: getProportionateScreenHeight(45),
              height: getProportionateScreenHeight(45),
            ),
          if (isLeft)
            SizedBox(
              width: getProportionateScreenWidth(20),
            ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment:
                  isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isLeft ? kPrimaryColor : const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getProportionateScreenWidth(15)),
                      topRight:
                          Radius.circular(getProportionateScreenWidth(15)),
                      bottomLeft: isLeft
                          ? const Radius.circular(0)
                          : Radius.circular(getProportionateScreenWidth(15)),
                      bottomRight: !isLeft
                          ? const Radius.circular(0)
                          : Radius.circular(getProportionateScreenWidth(15)),
                    ),
                  ),
                  padding: EdgeInsets.all(
                    getProportionateScreenWidth(10),
                  ),
                  child: Column(
                    children: [
                      if (image.isNotEmpty)
                        Container(
                          height: getProportionateScreenHeight(150),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(image),
                            ),
                          ),
                        ),
                      Text(
                        image.isNotEmpty ? image : content,
                        style: TextStyle(
                          color: image.isNotEmpty
                              ? const Color(0XFF007AFD)
                              : isLeft
                                  ? Colors.white
                                  : Colors.black,
                          decoration: image.isNotEmpty
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          decorationColor: const Color(0XFF007AFD),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isHaveTime)
                  SizedBox(height: getProportionateScreenWidth(10)),
                if (isHaveTime)
                  Text(
                    '8:10 am',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      color: const Color(0xFF757575),
                    ),
                  )
              ],
            ),
          ),
          const Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}
