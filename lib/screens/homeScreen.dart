import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sidh_shop/utils/routes.dart';
import 'package:sidh_shop/widgets/customButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOME SCREEN"),
            CustomButton(
              title: "SIGNOUT",
              isLoginButton: true,
              onPress: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, Routes.LOGIN);
              },
            )
          ],
        ),
      ),
    );
  }
}
