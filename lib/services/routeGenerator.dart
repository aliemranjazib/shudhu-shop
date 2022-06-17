import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidh_shop/screens/auth_screen/login_screen.dart';
import 'package:sidh_shop/screens/homeScreen.dart';

import '../utils/routes.dart';

class RouteGeneator {
  Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.HOME:
        return MaterialPageRoute(builder: (_) => HomeScreen());

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
