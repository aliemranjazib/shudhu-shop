import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sidh_shop/utils/constants.dart';

class CustomButton extends StatelessWidget {
  // const CustomButton({super.key});

  String? title;
  bool? isLoginButton;
  VoidCallback? onPress;
  bool? isLoading;
  CustomButton(
      {this.title,
      this.isLoginButton = false,
      this.isLoading = false,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        margin: EdgeInsets.all(17),
        width: double.infinity,
        child: Center(
            child: Stack(
          children: [
            Visibility(
              visible: isLoading! ? false : true,
              child: Text(
                title ?? "Button",
                style: TextStyle(
                  color: isLoginButton == true ? Colors.white : Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            Visibility(visible: isLoading!, child: CircularProgressIndicator()),
          ],
        )),
        decoration: BoxDecoration(
          border: Border.all(
            color: isLoginButton == true ? Colors.transparent : Colors.black,
          ),
          color: isLoginButton == true ? Colors.deepPurple : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
