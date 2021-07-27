import 'package:flutter/material.dart';
import 'package:shop_app/screens/help_center/components/contact_us_item.dart';
import 'package:shop_app/screens/help_center/components/faq_item.dart';
import 'package:shop_app/size_config.dart';

class HelpCenterBody extends StatelessWidget {
  const HelpCenterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            buildTitle('FAQ'),
            SizedBox(height: getProportionateScreenWidth(10)),
            const FAQItem(content: 'How long is my order delivery time?'),
            const FAQItem(content: 'How long is my order delivery time?'),
            const FAQItem(content: 'How to become a tokoto seller?'),
            const FAQItem(content: 'How does warranty work on tokoto?'),
            const FAQItem(content: "Why I don't accept otp on my phone?"),
            const FAQItem(content: 'How to rate my order products?'),
            SizedBox(height: getProportionateScreenWidth(20)),
            buildTitle('Contact Us'),
            SizedBox(height: getProportionateScreenWidth(10)),
            const ContactUsItem(
              icon: 'assets/icons/Conversation.svg',
              description: 'You can chat with us here',
              title: 'Chat Tokoto now',
            ),
            const ContactUsItem(
              icon: 'assets/icons/Mail.svg',
              description: 'Send your question or problem',
              title: 'Send Email',
            ),
            const ContactUsItem(
              icon: 'assets/icons/Call.svg',
              description: '1800806',
              title: 'Costumer Service',
            ),
            SizedBox(height: getProportionateScreenWidth(40)),
            const Center(
              child: Text(
                '© Copyright 2020 - Stay at Home',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
          ],
        ),
      ),
    );
  }

  SizedBox buildTitle(String title) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
