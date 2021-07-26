import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/size_config.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/main';
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<int> stacks = [0];
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (!stacks.contains(index)) {
      stacks.add(index);
    } else {
      stacks.remove(index);
      stacks.add(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        if (stacks.isNotEmpty) {
          if (stacks[stacks.length - 1] != 0) {
            stacks.removeLast();
            setState(() {
              _selectedIndex = stacks[stacks.length - 1];
            });
            return false;
          }
          return true;
        }
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _widgetOptions.elementAt(_selectedIndex),
            Positioned(
              bottom: 30,
              right: SizeConfig.screenWidth * 0.1,
              child: CustomBottomNavBar(
                  onItemTap: _onItemTapped, selectedIndex: _selectedIndex),
            )
          ],
        ),
      ),
    );
  }
}
