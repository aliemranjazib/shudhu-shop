import 'package:flutter/material.dart';
import 'package:sidh_shop/widgets/customButton.dart';

class CustomDialogue extends StatelessWidget {
  // const CustomDialogue({Key? key}) : super(key: key);
  String? text;
  CustomDialogue({this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(text!),
      actions: [
        CustomButton(
          title: "OK",
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
