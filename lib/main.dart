import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sidh_shop/landing_screen.dart';
import 'package:sidh_shop/layout_screen.dart';
// import 'package:sidh_shop/screens/auth_screen/login_screen.dart';
import 'package:sidh_shop/screens/user_side/screens/homeScreen.dart';
import 'package:sidh_shop/services/cacher_service.dart';
import 'package:sidh_shop/services/routeGenerator.dart';
import 'package:sizer/sizer.dart';

// import 'package:sidh_shop/screens/initial_screen.dart';
///nrf4rtiugt5ihgm5yiohm6yjokummm
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDW_KSVFcn5Udjli7YM7nccS7N8UqChWgk",
            authDomain: "sidhu-shop.firebaseapp.com",
            projectId: "sidhu-shop",
            storageBucket: "sidhu-shop.appspot.com",
            messagingSenderId: "1092043600371",
            appId: "1:1092043600371:web:88303552bafe1e7ad06286"));
  }
  await Firebase.initializeApp();
  await MyPrefferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Sidhu App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LandingScreen(),
        onGenerateRoute: RouteGeneator().generateRoute,
      );
    });
  }
}
