import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/components/loader.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class MyAccountForm extends StatefulWidget {
  const MyAccountForm({Key? key}) : super(key: key);

  @override
  State<MyAccountForm> createState() => _MyAccountFormState();
}

class _MyAccountFormState extends State<MyAccountForm> {
  final _formKey = GlobalKey<FormState>();
  String? firstName, lastName, phone, address, email;
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

  void _onSaveChanges() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // dismiss keyboard during async call
      FocusScope.of(context).requestFocus(FocusNode());

      Navigator.of(context).restorablePush(dialogBuilder);

      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pop();
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
          buildEmailTextField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPhoneNumberTextField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildAddressTextField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPostalCodeTextField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildHomeNumberTextField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          FormError(errors: errors),
          DefaultButton(text: 'Save Changes', onPress: _onSaveChanges),
        ],
      ),
    );
  }

  TextFormField buildAddressTextField() {
    return TextFormField(
      initialValue: 'Ho Chi Minh, Viet Nam',
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
      decoration: const InputDecoration(
        hintText: 'Enter your address',
        labelText: 'Address',
        suffixIcon:
            CustomSuffixIcon(svgIconSrc: 'assets/icons/Location point.svg'),
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      readOnly: true,
      initialValue: 'nqviet.dev@gmail.com',
      decoration: const InputDecoration(
        hintText: 'Enter your email',
        labelText: 'Email',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/Mail.svg'),
      ),
    );
  }

  TextFormField buildPostalCodeTextField() {
    return TextFormField(
      readOnly: true,
      initialValue: '90712',
      decoration: const InputDecoration(
        hintText: 'Enter your postal code',
        labelText: 'Postal code',
        suffixIcon:
            CustomSuffixIcon(svgIconSrc: 'assets/icons/Location point.svg'),
      ),
    );
  }

  TextFormField buildHomeNumberTextField() {
    return TextFormField(
      readOnly: true,
      initialValue: '74',
      decoration: const InputDecoration(
        hintText: 'Enter your home number',
        labelText: 'Home Number',
        suffixIcon:
            CustomSuffixIcon(svgIconSrc: 'assets/icons/Location point.svg'),
      ),
    );
  }

  TextFormField buildPhoneNumberTextField() {
    return TextFormField(
      initialValue: '+84 905377903',
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
      decoration: const InputDecoration(
        hintText: 'Enter your phone number',
        labelText: 'Phone Number',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/Phone.svg'),
      ),
    );
  }

  TextFormField buildLastNameTextField() {
    return TextFormField(
      initialValue: 'Nguyen',
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
      decoration: const InputDecoration(
        hintText: 'Enter your last name',
        labelText: 'Last Name',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/User.svg'),
      ),
    );
  }

  TextFormField buildFirstNameTextField() {
    return TextFormField(
      initialValue: 'Viet',
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
      decoration: const InputDecoration(
        hintText: 'Enter your first name',
        labelText: 'First Name',
        suffixIcon: CustomSuffixIcon(svgIconSrc: 'assets/icons/User.svg'),
      ),
    );
  }
}
