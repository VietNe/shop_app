import 'package:flutter/material.dart';
import 'package:shop_app/screens/my_account/components/my_account_form.dart';
import 'package:shop_app/screens/profile/components/profile_pic.dart';
import 'package:shop_app/size_config.dart';

class MyAccountBody extends StatelessWidget {
  const MyAccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(
              getProportionateScreenHeight(20),
            ),
            child: const MyAccountForm(),
          ),
        ],
      ),
    );
  }
}
