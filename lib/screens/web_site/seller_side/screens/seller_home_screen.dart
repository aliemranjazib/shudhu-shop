import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:sidh_shop/screens/web_site/seller_side/screens/add_products_screen.dart';
import 'package:sidh_shop/screens/web_site/seller_side/screens/dashboard_screen.dart';
import 'package:sidh_shop/utils/routes.dart';
import 'package:sidh_shop/widgets/customButton.dart';

class SellerHomeScreen extends StatefulWidget {
  static const id = 'sellerHome';

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  // const SellerHomeScreen({Key? key}) : super(key: key);
  Widget selectedRoute = DashBoardScreen();

  chooseScreen(item) {
    switch (item.route) {
      case DashBoardScreen.id:
        setState(() {
          selectedRoute = DashBoardScreen();
        });
        break;
      case AddProductScreen.id:
        setState(() {
          selectedRoute = AddProductScreen();
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(" SELLER HOME SCREEN"),
      ),
      sideBar: SideBar(
        selectedRoute: SellerHomeScreen.id,
        onSelected: (item) {
          chooseScreen(item);
        },
        items: [
          AdminMenuItem(
              title: 'DASHBOARD',
              icon: Icons.dashboard,
              route: DashBoardScreen.id),
          AdminMenuItem(
              title: 'ADD PRODUCT',
              icon: Icons.add,
              route: AddProductScreen.id),
        ],
      ),
      body: selectedRoute,
    );
  }
}
