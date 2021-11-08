import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login.dart';
import '../utils/navigator.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen();
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  bool loggedIn;

  @override
  void initState() {
    super.initState();

    _navigateLogin();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image.asset('assets/icon/icon.png', width: 177, height: 98),
        ),
      ),
    );
  }

  _navigateLogin() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    getCred();
  }

  void getCred() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      loggedIn = preferences.getBool("logged_in") ?? false;
      if (loggedIn) {
        Nav.routeReplacement(context, Home());
      } else {
        Nav.routeReplacement(context, LoginScreen());
      }
    });
  }
}
