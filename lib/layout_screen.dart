import 'package:flutter/material.dart';
import 'package:sidh_shop/landing_screen.dart';
// import 'package:sidh_shop/screens/auth_screen/login_screen.dart';
import 'package:sidh_shop/screens/web_site/web_mainScreen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.minWidth > 600) {
          return WebMainScreen();
        } else {
          return LandingScreen();
        }
      }),
    );
  }
}
