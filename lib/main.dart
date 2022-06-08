import 'package:flutter/material.dart';
import 'package:sidh_shop/screens/auth_screen/login_screen.dart';
import 'package:sidh_shop/screens/homeScreen.dart';
import 'package:sidh_shop/services/routeGenerator.dart';
// import 'package:sidh_shop/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sidhu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      onGenerateRoute: RouteGeneator().generateRoute,
    );
  }
}
