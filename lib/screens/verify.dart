import 'package:educand/screens/register.dart';
import 'package:flutter/material.dart';

import '../utils/navigator.dart';

class VerifyScreen extends StatefulWidget {
  VerifyScreen();

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  String enteredCodeOne;
  FocusNode pin0FocusNode;
  FocusNode pin1FocusNode;
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pin0FocusNode = new FocusNode();
    pin1FocusNode = new FocusNode();
    pin2FocusNode = new FocusNode();
    pin3FocusNode = new FocusNode();
    pin4FocusNode = new FocusNode();
    pin5FocusNode = new FocusNode();
    pin6FocusNode = new FocusNode();
  }

  @override
  void dispose() {
    pin0FocusNode.dispose();
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void nextField(
      String value, FocusNode nextFocusNode, FocusNode prevFocusNode) {
    if (value.length == 1) {
      nextFocusNode.requestFocus();
    } else if (value.length == 0) {
      prevFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 36),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, right: 40, left: 40, bottom: 53),
              child:
                  Image.asset('assets/icon/icon.png', width: 121, height: 68),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 19,
              ),
              child: Text(
                'Verify phone number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50.0,
                top: 0.0,
                bottom: 40.0,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      'Please enter the verification code sent to your mobile ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[500],
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '***923',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[500],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 40.0,
              ),
              child: Form(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        autofocus: true,
                        obscureText: true,
                        focusNode: pin1FocusNode,
                        textAlign: TextAlign.center,
                        decoration: otpDecoration(),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          nextField(value, pin2FocusNode, pin0FocusNode);
                        },
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        focusNode: pin2FocusNode,
                        textAlign: TextAlign.center,
                        decoration: otpDecoration(),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          nextField(value, pin3FocusNode, pin1FocusNode);
                        },
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        focusNode: pin3FocusNode,
                        textAlign: TextAlign.center,
                        decoration: otpDecoration(),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          nextField(value, pin4FocusNode, pin2FocusNode);
                        },
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        focusNode: pin4FocusNode,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: otpDecoration(),
                        onChanged: (value) {
                          nextField(value, pin5FocusNode, pin3FocusNode);
                        },
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        focusNode: pin5FocusNode,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: otpDecoration(),
                        onChanged: (value) {
                          nextField(value, pin6FocusNode, pin4FocusNode);
                        },
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        focusNode: pin6FocusNode,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: otpDecoration(),
                        onChanged: (value) {
                          pin6FocusNode.unfocus();
                          Nav.routeReplacement(context, RegisterScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration otpDecoration() {
    return InputDecoration(
      fillColor: Colors.white,
      hintText: "",
      hintStyle: TextStyle(
        fontSize: 13.0,
        color: Colors.grey[500],
        fontWeight: FontWeight.w500,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          style: BorderStyle.solid,
          color: Color(0xFFFFB206),
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          style: BorderStyle.solid,
          color: Color(0xFFFFB206),
        ),
      ),
      filled: true,
    );
  }
}
