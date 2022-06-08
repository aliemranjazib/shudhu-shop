import 'package:flutter/material.dart';
import 'package:sidh_shop/utils/constants.dart';
import 'package:sidh_shop/utils/routes.dart';
import 'package:sidh_shop/widgets/customButton.dart';
import 'package:sidh_shop/widgets/custom_textField.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 70),
            Text(
              "WELCOME PLEASE LOGIN FIRST",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: headingFontSize,
              ),
            ),
            CustomTextField(
              controller: emailC,
              hintText: "enter your email",
              validation: (v) {
                if (v!.isEmpty) {
                  return "not be emopty";
                }
                return null;
              },
            ),
            CustomTextField(
              controller: passwordC,
              hintText: "enter your password",
              validation: (v) {
                if (v!.isEmpty) {
                  return "not be emopty";
                }
                return null;
              },
            ),
            CustomButton(
              isLoginButton: true,
              title: "Login",
              onPress: () {},
              isLoading: false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Forgot Password?"),
                TextButton(onPressed: () {}, child: Text("Click here"))
              ],
            ),
            Text("Don't have any account yet?"),
            CustomButton(
              isLoginButton: false,
              title: "SIGNUP",
              onPress: () {
                Navigator.pushNamed(context, Routes.SIGNUP);
              },
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
