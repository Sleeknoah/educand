import 'package:educand/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TestResult extends StatefulWidget {
  @override
  TestResultState createState() => TestResultState();
}

class TestResultState extends State<TestResult> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: c8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 80,
                  height: 80,
                  child: new Image.asset(
                    'assets/images/whatsapp.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Text(
                    'Chat with us on',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF442B76),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () => launch('https://wa.link/wuknal'),
                    child: Text(
                      'Whatsapp: \n+2347040060013',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF442B76),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Chat with our Customer Care \n and we will help you set up \n your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6F6F6F),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
