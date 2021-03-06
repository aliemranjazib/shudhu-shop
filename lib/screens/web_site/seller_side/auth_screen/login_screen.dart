import 'package:flutter/material.dart';
import 'package:sidh_shop/services/auth_service.dart';
import 'package:sidh_shop/utils/constants.dart';
import 'package:sidh_shop/utils/routes.dart';
import 'package:sidh_shop/widgets/customButton.dart';
import 'package:sidh_shop/widgets/custom_dialogue.dart';
import 'package:sidh_shop/widgets/custom_textField.dart';

class SellerLoginScreen extends StatefulWidget {
  @override
  State<SellerLoginScreen> createState() => _SellerLoginScreenState();
}

class _SellerLoginScreenState extends State<SellerLoginScreen> {
  // const SellerLoginScreen({Key? key}) : super(key: key);
  TextEditingController emailC = TextEditingController();

  TextEditingController passwordC = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool formStateLoading = false;

  submit() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        formStateLoading = true;
      });
      print(emailC.text);
      String? accountStatus =
          await AuthService.signIn(emailC.text, passwordC.text);
      if (accountStatus != null) {
        setState(() {
          formStateLoading = false;
        });
        showDialog(
            context: context,
            builder: ((context) {
              return CustomDialogue(
                text: accountStatus,
              );
            }));
      } else {
        Navigator.pushReplacementNamed(context, Routes.SELLERHOME);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.10),
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
          Form(
            key: formkey,
            child: Column(
              children: [
                CustomTextField(
                  controller: emailC,
                  labeltext: "Email",
                  hintText: "enter your email",
                  validation: (v) {
                    if (v!.isEmpty) {
                      return "not be empty";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: passwordC,
                  labeltext: "Password",
                  hintText: "enter your password",
                  validation: (v) {
                    if (v!.isEmpty) {
                      return "not be empty";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          CustomButton(
            isLoginButton: true,
            title: "Login",
            onPress: () {
              print("aaaaaaaaaaaaaaaa");
              submit();
            },
            isLoading: formStateLoading,
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
              Navigator.pushNamed(context, Routes.SELLERSIGNUP);
            },
            isLoading: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("go to main screen "),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.MAIN);
                  },
                  child: Text("Click here"))
            ],
          ),
        ],
      ),
    );
  }
}
