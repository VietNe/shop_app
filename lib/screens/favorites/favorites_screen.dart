import 'package:flutter/material.dart';
import 'package:shop_app/screens/favorites/components/favorites_body.dart';

class FavoritesScreen extends StatelessWidget {
  static String routeName = "/favorites";

  const FavoritesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: const FavoritesBody(),
    );
  }
}
