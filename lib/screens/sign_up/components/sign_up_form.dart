import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/components/loader.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email, password, confirmPassword;
  bool remember = false;

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

  final List<String> errors = [];

  void _onSignUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // dismiss keyboard during async call
      FocusScope.of(context).requestFocus(FocusNode());

      Navigator.of(context).restorablePush(dialogBuilder);

      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, CompleteProfileScreen.routeName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailTextField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPasswordTextField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildConfirmPasswordTextField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          DefaultButton(text: 'Continue', onPress: _onSignUp),
        ],
      ),
    );
  }

  TextFormField buildPasswordTextField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          removeError(error: kShortPassError);
        }
        password = value;
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
    );
  }

  TextFormField buildConfirmPasswordTextField() {
    return TextFormField(
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kRePassNullError)) {
          removeError(error: kRePassNullError);
        } else if (value.isNotEmpty && password == value) {
          removeError(error: kMatchPassError);
        }
        confirmPassword = value;
      },
      validator: (value) {
        if ((value == null || value.isEmpty) &&
            !errors.contains(kRePassNullError)) {
          addError(error: kRePassNullError);

          return '';
        } else if (value != null &&
            value.isNotEmpty &&
            password != confirmPassword) {
          addError(error: kMatchPassError);

          return '';
        } else if (errors.contains(kPassNullError) ||
            errors.contains(kMatchPassError)) {
          return '';
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Re-enter your password',
        labelText: 'Confirm Password',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/Lock.svg'),
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if ((value == null || value.isEmpty) &&
            !errors.contains(kEmailNullError)) {
          addError(error: kEmailNullError);

          return '';
        } else if (value != null &&
            !emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError) &&
            !errors.contains(kEmailNullError)) {
          addError(error: kInvalidEmailError);

          return '';
        } else if (errors.contains(kEmailNullError) ||
            errors.contains(kInvalidEmailError)) {
          return '';
        }

        return null;
      },
      decoration: const InputDecoration(
        hintText: 'Enter your email',
        labelText: 'Email',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/Mail.svg'),
      ),
    );
  }
}
