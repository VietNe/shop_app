import 'package:flutter/material.dart';
import 'package:shop_app/screens/feedback/components/feedback_body.dart';

class FeedbackScreen extends StatelessWidget {
  static String routeName = '/feedback';
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback'), centerTitle: true),
      body: const FeedbackBody(),
    );
  }
}
