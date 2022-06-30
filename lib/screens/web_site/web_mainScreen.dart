import 'package:flutter/material.dart';
import 'package:sidh_shop/screens/web_site/seller_side/auth_screen/login_screen.dart';

class WebMainScreen extends StatelessWidget {
  const WebMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("WEB MAIN SCREEN"),
            SellerLoginScreen(),
          ],
        ),
      ),
    );
  }
}
