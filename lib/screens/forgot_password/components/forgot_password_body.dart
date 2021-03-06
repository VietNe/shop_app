import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/components/loader.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/confirm_password/confirm_password_screen.dart';
import 'package:shop_app/size_config.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({Key? key}) : super(key: key);

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
                "Forgot Password",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Please enter your email and we will send \nyou a link to return to your account",
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
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
            },
            validator: (value) {
              if ((value == null || value.isEmpty) &&
                  !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
                return '';
              } else if (value != null &&
                  !emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError) &&
                  !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
                return '';
              } else if (errors.contains(kEmailNullError) ||
                  errors.contains(kInvalidEmailError)) {
                return '';
              }

              return null;
            },
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(svgIconSrc: "assets/icons/Mail.svg"),
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
                  Navigator.pushReplacementNamed(
                      context, ConfirmPasswordScreen.routeName);
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
