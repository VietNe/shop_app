import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/otp/components/otp_form.dart';
import 'package:shop_app/size_config.dart';

const initStartTimer = 10;

class OTPBody extends StatefulWidget {
  const OTPBody({Key? key}) : super(key: key);

  @override
  _OTPBodyState createState() => _OTPBodyState();
}

class _OTPBodyState extends State<OTPBody> {
  Timer? _timer;
  int _start = initStartTimer;

  void startTimer() {
    if (_start == 0) {
      setState(() {
        _start = initStartTimer;
      });
    }
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Text("OTP Verification", style: headingStyle),
                const Text(
                  "We sent your code to +1 898 860 ***",
                  textAlign: TextAlign.center,
                ),
                buildTimer(),
                // SizedBox(height: SizeConfig.screenHeight * 0.06),
                const OTPForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.07),
                if (_start == 0)
                  (GestureDetector(
                    onTap: () {
                      // OTP code resend
                      startTimer();
                    },
                    child: const Text(
                      "Resend OTP Code",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in "),
        Text(
          "00:${_start.toString().padLeft(2, '0')}s",
          style: const TextStyle(color: kPrimaryColor),
        ),
      ],
    );
  }
}
