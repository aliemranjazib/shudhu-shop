import 'package:flutter/material.dart';
import 'package:sidh_shop/utils/routes.dart';
import 'package:sidh_shop/utils/styles.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            box("SELLER", () {
              Navigator.pushReplacementNamed(context, Routes.SELLERLOGIN);
            }),
            box("BUYER", () {
              Navigator.pushReplacementNamed(context, Routes.LOGIN);
            }),
          ],
        ),
      )),
    );
  }

  Widget box(String title, Function function) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        height: 30.h,
        width: 80.w,
        margin: EdgeInsets.all(20),
        decoration: AppStyle.boxstyle,
        child: Center(
            child: Text(
          "$title",
          style: AppStyle.textbutton,
        )),
      ),
    );
  }
}
