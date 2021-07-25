import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/loader.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/size_config.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({Key? key}) : super(key: key);

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  FocusNode? pin1FocusNode;
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();

    pin1FocusNode!.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode!.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OTPInput(focusNode: pin1FocusNode, nextFocusNode: pin2FocusNode),
              OTPInput(focusNode: pin2FocusNode, nextFocusNode: pin3FocusNode),
              OTPInput(focusNode: pin3FocusNode, nextFocusNode: pin4FocusNode),
              OTPInput(
                  focusNode: pin4FocusNode,
                  nextFocusNode: pin4FocusNode,
                  isLastNode: true),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          DefaultButton(
            text: "Continue",
            onPress: () {
              FocusScope.of(context).requestFocus(FocusNode());

              Navigator.of(context).restorablePush(dialogBuilder);

              Future.delayed(const Duration(seconds: 3), () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginSuccessScreen.routeName, (route) => false);
              });
            },
          )
        ],
      ),
    );
  }
}

class OTPInput extends StatelessWidget {
  const OTPInput(
      {Key? key,
      required this.focusNode,
      required this.nextFocusNode,
      this.isLastNode = false})
      : super(key: key);

  final FocusNode? focusNode, nextFocusNode;
  final bool isLastNode;

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getProportionateScreenWidth(10)),
      child: SizedBox(
        width: getProportionateScreenWidth(60),
        child: TextFormField(
          focusNode: focusNode,
          style: const TextStyle(fontSize: 24),
          obscureText: true,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: otpInputDecoration,
          onChanged: (value) {
            if (!isLastNode) {
              nextField(value, nextFocusNode);
            } else {
              focusNode!.unfocus();
            }
          },
        ),
      ),
    );
  }
}
