import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/loader.dart';
import 'package:shop_app/screens/settings/components/setting_item.dart';
import 'package:shop_app/size_config.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({Key? key}) : super(key: key);

  void _onSaveChanges(BuildContext context) {
    Navigator.of(context).restorablePush(dialogBuilder);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ListView(
            children: [
              SettingItem(title: 'Notifications', value: true),
              SettingItem(title: 'Ask before buy', value: true),
              SettingItem(title: 'Color blind mode', value: false),
              SizedBox(height: getProportionateScreenWidth(96)),
            ],
          ),
          Positioned(
            bottom: getProportionateScreenHeight(20),
            child: SizedBox(
              width: SizeConfig.screenWidth,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: DefaultButton(
                    text: 'Save Changes',
                    onPress: () => _onSaveChanges(context)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
