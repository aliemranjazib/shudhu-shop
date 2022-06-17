import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sidh_shop/services/cacher_service.dart';
import 'package:sidh_shop/utils/routes.dart';
import 'package:sidh_shop/widgets/customButton.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  TextEditingController et = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOME SCREEN"),
            TextFormField(
              controller: et,
            ),
            Text("value is  ${MyPrefferences.getEmail()}"),
            CustomButton(
              title: "SIGNOUT",
              isLoginButton: true,
              onPress: () {
                print(et.text);
                MyPrefferences.saveEmail(et.text);
                // FirebaseAuth.instance.signOut();
                // Navigator.pushReplacementNamed(context, Routes.LOGIN);
              },
            ),
            CustomButton(
              title: "DELETE",
              isLoginButton: true,
              onPress: () {
                print(et.text);
                MyPrefferences.removeEmail();
                // FirebaseAuth.instance.signOut();
                // Navigator.pushReplacementNamed(context, Routes.LOGIN);
              },
            )
          ],
        ),
      ),
    );
  }
}
