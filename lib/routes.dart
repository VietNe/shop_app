import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/checkout/checkout_screen.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/confirm_password/confirm_password_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/favorites/favorites_screen.dart';
import 'package:shop_app/screens/feedback/feedback_screen.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/help_center/help_center_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/main/main_screen.dart';
import 'package:shop_app/screens/messages/messages_screen.dart';
import 'package:shop_app/screens/messages_store/messages_store_screen.dart';
import 'package:shop_app/screens/my_account/my_account_screen.dart';
import 'package:shop_app/screens/notifications/notifications_screen.dart';
import 'package:shop_app/screens/order_success/oder_success_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/settings/settings_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OTPScreen.routeName: (context) => const OTPScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  MyAccountScreen.routeName: (context) => const MyAccountScreen(),
  FavoritesScreen.routeName: (context) => const FavoritesScreen(),
  MessagesScreen.routeName: (context) => const MessagesScreen(),
  SettingsScreen.routeName: (context) => const SettingsScreen(),
  OrderSuccessScreen.routeName: (context) => const OrderSuccessScreen(),
  NotificationsScreen.routeName: (context) => const NotificationsScreen(),
  CheckoutScreen.routeName: (context) => const CheckoutScreen(),
  HelpCenterScreen.routeName: (context) => const HelpCenterScreen(),
  MessagesStoreScreen.routeName: (context) => const MessagesStoreScreen(),
  ConfirmPasswordScreen.routeName: (context) => const ConfirmPasswordScreen(),
  FeedbackScreen.routeName: (context) => const FeedbackScreen(),
};
