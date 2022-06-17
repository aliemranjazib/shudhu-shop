import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:sidh_shop/screens/auth_screen/login_screen.dart';
import 'package:sidh_shop/screens/user_side/screens/homeScreen.dart';
import 'package:sidh_shop/screens/main_screen.dart';

class LandingScreen extends StatelessWidget {
  // const LandingScreen({super.key});
  Future<FirebaseApp> initilize = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initilize,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot streamShot) {
              if (streamShot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("${streamShot.error}"),
                  ),
                );
              }
              if (streamShot.connectionState == ConnectionState.active) {
                User? user = streamShot.data;
                if (user == null) {
                  return MainScreen();
                } else {
                  return HomeScreen();
                }
              }

              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("CHECKING AUTHENTICATION......"),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("INITILIZATING APP......"),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
