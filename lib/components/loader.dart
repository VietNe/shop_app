import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:shop_app/constants.dart';

Route<Object?> dialogBuilder(BuildContext context, Object? arguments) {
  return DialogRoute<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: LoadingBouncingGrid.square(
        size: 70,
        backgroundColor: kPrimaryColor,
      ),
    ),
  );
}
