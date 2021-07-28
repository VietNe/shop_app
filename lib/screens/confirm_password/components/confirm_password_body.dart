import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/components/loader.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class ConfirmPasswordBody extends StatelessWidget {
  const ConfirmPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Confirm Password",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Please enter your new password",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              const ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? password;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kPassNullError)) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8 &&
                  errors.contains(kShortPassError)) {
                removeError(error: kShortPassError);
              }
            },
            validator: (value) {
              if ((value == null || value.isEmpty) &&
                  !errors.contains(kPassNullError)) {
                addError(error: kPassNullError);

                return '';
              } else if (value != null &&
                  value.length < 8 &&
                  !errors.contains(kShortPassError) &&
                  !errors.contains(kPassNullError)) {
                addError(error: kShortPassError);

                return '';
              } else if (errors.contains(kPassNullError) ||
                  errors.contains(kShortPassError)) {
                return '';
              }
              return null;
            },
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Enter your password',
              labelText: 'Password',
              suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/Lock.svg'),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            onPress: () {
              if (_formKey.currentState!.validate()) {
                // Do what you want to do
                _formKey.currentState!.save();
                // dismiss keyboard during async call
                FocusScope.of(context).requestFocus(FocusNode());

                Navigator.of(context).restorablePush(dialogBuilder);

                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                });
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          const NoAccountText(
            isForgotPassScreen: true,
          ),
        ],
      ),
    );
  }
}
