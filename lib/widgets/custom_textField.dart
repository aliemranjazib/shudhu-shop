import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  // const CustomTextField({super.key});
  String? hintText;
  TextEditingController? controller;
  Widget? icon;
  String? Function(String?)? validation;
  int? maxLine;
  String? labeltext;
  bool? isPassword = false;
  CustomTextField(
      {this.controller,
      this.hintText,
      this.icon,
      this.isPassword = false,
      this.maxLine,
      this.labeltext,
      this.validation});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          obscureText: isPassword!,
          maxLines: maxLine ?? 1,
          controller: controller,
          validator: validation,
          decoration: InputDecoration(
            suffixIcon: icon,
            labelText: labeltext,
            border: InputBorder.none,
            hintText: hintText ?? "enter hint",
            contentPadding: EdgeInsets.all(15),
          ),
        ));
  }
}
