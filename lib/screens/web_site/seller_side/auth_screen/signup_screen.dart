import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sidh_shop/services/auth_service.dart';
import 'package:sidh_shop/utils/constants.dart';
import 'package:sidh_shop/utils/routes.dart';
import 'package:sidh_shop/widgets/customButton.dart';
import 'package:sidh_shop/widgets/custom_dialogue.dart';
import 'package:sidh_shop/widgets/custom_textField.dart';

class SellerSignupScreen extends StatefulWidget {
  @override
  State<SellerSignupScreen> createState() => _SellerSignupScreenState();
}

class _SellerSignupScreenState extends State<SellerSignupScreen> {
  // const SellerSignupScreen({Key? key}) : super(key: key);
  TextEditingController emailC = TextEditingController();
  TextEditingController userNameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController phonC = TextEditingController();
  TextEditingController repasswordC = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool formStateLoading = false;

  submit() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        formStateLoading = true;
      });
      print(emailC.text);
      String? accountStatus =
          await AuthService.createAccountAsSeller(emailC.text, passwordC.text)
              .then((value) {
        Future.delayed(Duration(seconds: 2), () {
          FirebaseFirestore.instance.collection('users').add({
            "userName": userNameC.text,
            "email": emailC.text,
            'phone': phonC.text
          });
        });
      });

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
        Navigator.pushReplacementNamed(context, Routes.LOGIN);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                SizedBox(height: 70),
                Text(
                  "WELCOME \n PLEASE SIGNUP",
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
                        controller: userNameC,
                        hintText: "enter your user name",
                        validation: (v) {
                          if (v!.isEmpty) {
                            return "not be empty";
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: phonC,
                        hintText: "enter your Phone Number",
                        validation: (v) {
                          if (v!.isEmpty) {
                            return "not be empty";
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: emailC,
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
                        hintText: "enter your password",
                        validation: (v) {
                          if (v!.isEmpty) {
                            return "not be empty";
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: repasswordC,
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
                  title: "SIGNUP",
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
                  title: "LOGIN",
                  onPress: () {
                    Navigator.pushNamed(context, Routes.WEBMAIN);
                  },
                  isLoading: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
