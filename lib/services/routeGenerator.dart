import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sidh_shop/screens/user_side/screens/homeScreen.dart';
import 'package:sidh_shop/screens/main_screen.dart';
import 'package:sidh_shop/screens/seller_side/auth_screen/login_screen.dart';
import 'package:sidh_shop/screens/seller_side/auth_screen/signup_screen.dart';
import 'package:sidh_shop/screens/seller_side/screens/seller_home_screen.dart';
import 'package:sidh_shop/screens/user_side/auth_screen/login_screen.dart';
import 'package:sidh_shop/screens/user_side/auth_screen/signup_screen.dart';

import '../utils/routes.dart';

class RouteGeneator {
  Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.HOME:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.SIGNUP:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case Routes.SELLERLOGIN:
        return MaterialPageRoute(builder: (_) => SellerLoginScreen());
      case Routes.SELLERSIGNUP:
        return MaterialPageRoute(builder: (_) => SellerSignupScreen());
      case Routes.SELLERHOME:
        return MaterialPageRoute(builder: (_) => SellerHomeScreen());
      case Routes.MAIN:
        return MaterialPageRoute(builder: (_) => MainScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("NO ROUTE DEFINED"),
                  ),
                ));
    }
  }
}
