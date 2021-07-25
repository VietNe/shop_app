import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/components/loader.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String? firstName, lastName, phone, address;
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
          buildFirstNameTextField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildLastNameTextField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPhoneNumberTextField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildAddressTextField(),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          DefaultButton(text: 'Continue', onPress: _onSignUp),
        ],
      ),
    );
  }

  TextFormField buildAddressTextField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kAddressNullError)) {
          removeError(error: kAddressNullError);
        }
      },
      validator: (value) {
        if ((value == null || value.isEmpty) &&
            !errors.contains(kAddressNullError)) {
          addError(error: kAddressNullError);

          return '';
        } else if (errors.contains(kAddressNullError)) {
          return '';
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Enter your address',
        labelText: 'Address',
        suffixIcon:
            CustomSuffixIcon(svgIconSrc: 'assets/icons/Location point.svg'),
      ),
    );
  }

  TextFormField buildPhoneNumberTextField() {
    return TextFormField(
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
          removeError(error: kPhoneNumberNullError);
        }
      },
      validator: (value) {
        if ((value == null || value.isEmpty) &&
            !errors.contains(kPhoneNumberNullError)) {
          addError(error: kPhoneNumberNullError);

          return '';
        } else if (errors.contains(kPhoneNumberNullError)) {
          return '';
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Enter your phone number',
        labelText: 'Phone Number',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/Phone.svg'),
      ),
    );
  }

  TextFormField buildLastNameTextField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNamelNullError)) {
          removeError(error: kNamelNullError);
        }
      },
      validator: (value) {
        if ((value == null || value.isEmpty) &&
            !errors.contains(kNamelNullError)) {
          addError(error: kNamelNullError);

          return '';
        } else if (errors.contains(kNamelNullError)) {
          return '';
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Enter your last name',
        labelText: 'Last Name',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/User.svg'),
      ),
    );
  }

  TextFormField buildFirstNameTextField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNamelNullError)) {
          removeError(error: kNamelNullError);
        }
      },
      validator: (value) {
        if ((value == null || value.isEmpty) &&
            !errors.contains(kNamelNullError)) {
          addError(error: kNamelNullError);

          return '';
        } else if (errors.contains(kNamelNullError)) {
          return '';
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Enter your first name',
        labelText: 'First Name',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/User.svg'),
      ),
    );
  }
}
