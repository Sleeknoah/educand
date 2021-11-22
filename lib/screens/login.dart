import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:educand/screens/register.dart';
import 'package:educand/utils/savedata.dart';
import 'package:educand/utils/text_filed_decor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

import '../screens/home.dart';
import '../utils/progressdialog.dart';
import '../widgets/submitbutton.dart';

class LoginScreen extends StatefulWidget {
  final String message;
  LoginScreen({this.message});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String enteredUserText;
  String enteredPassText;

  ProgressDialog progressDialog;

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      if (widget.message != null) {
        _showSuccessDialog("Your account has been created successfully!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Logging in...');

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        top: 0, right: 40, left: 40, bottom: 100),
                    child: Image.asset('assets/icon/icon.png',
                        width: 177, height: 98)),
                TextDecor(
                    s: (newText) {
                      enteredUserText = newText;
                    },
                    hint: "Username"),
                TextDecor(
                    isObscure: true,
                    icon: Icon(
                      Icons.remove_red_eye_sharp,
                    ),
                    s: (newText) {
                      enteredPassText = newText;
                    },
                    hint: "Password"),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 6.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'Forgot your password?',
                        style: TextStyle(
                          color: Color(0xFFFFB206),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        // children: <TextSpan>[
                        //   TextSpan(
                        //       text: ' Sign up',
                        //       style: TextStyle(
                        //           color: Colors.blueAccent, fontSize: 18),
                        //       recognizer: TapGestureRecognizer()
                        //         ..onTap = () {
                        //           // navigate to desired screen
                        //         })
                        // ]
                      ),
                    ),
                  ),
                ),
                SubmitButton(
                  title: "Login",
                  act: () async {
                    if (enteredUserText != null && enteredPassText != null) {
                      _showLoginDialog();

                      http.Response response = await http.post(
                          'https://ozmites.com/educand/process_login.php',
                          body: {
                            'username': enteredUserText,
                            'password': enteredPassText
                          });
                      if (response.statusCode == 200) {
                        print(response.body);
                        if (response.body == "success") {
                          http.Response response = await http.post(
                              'https://ozmites.com/educand/get_profile.php',
                              body: {
                                'username': enteredUserText,
                              });
                          log("response.body --- ${response.body}");
                          await FlutterSession()
                              .set("userProfile", response.body);
                          Map<String, dynamic> data = jsonDecode(response.body);
                          _saveData(data);

                          Navigator.of(context).pop();

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        } else if (response.body == "wronguser") {
                          Navigator.of(context).pop();
                          _showErrorDialog("Incorrect Username!");
                        } else if (response.body == "wrongpass") {
                          Navigator.of(context).pop();
                          _showErrorDialog("Incorrect Password!");
                        }
                      } else {
                        print(
                            'Request failed with status: ${response.statusCode}.');
                        Navigator.of(context).pop();
                        _showErrorDialog("Connection Error!");
                      }
                    } else {
                      _showErrorDialog("Incomplete Details!");
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Home(),
                      //   ),
                      // );
                    }
                  },
                ),
                SizedBox(height: 40),
                RichText(
                  text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Sign up',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              })
                      ]),

                  // GestureDetector(
                  //   onTap: () {

                  //   },
                  //   child: Text(
                  //     "Sign Up",
                  //     style: TextStyle(
                  //         color: Theme.of(context).primaryColor,
                  //         fontSize: 17),
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showErrorDialog(String text) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: new Container(
                height: MediaQuery.of(context).size.height / 12.0,
                child: Row(children: <Widget>[
                  Center(
                    child: Icon(Icons.error, size: 60, color: Colors.redAccent),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ]),
              ),
            ));
  }

  _showLoginDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: new Container(
                height: MediaQuery.of(context).size.height / 12.0,
                child: Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Image.asset(
                        'assets/images/loading.gif',
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Logging In ...",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ]),
              ),
            ));
  }

  _showSuccessDialog(String text) {
    showDialog(
      context: context,
      // ignore: deprecated_member_use
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        content: Container(
          height: MediaQuery.of(context).size.height / 3.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.verified_user,
                size: 66,
                color: Color(0xFF10CA88),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    "Registration Successful!",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveData(Map<String, dynamic> data) {
    SaveData.saveBoolData("logged_in", true);
    SaveData.saveStringData('full_name', data["fullname"]);
    SaveData.saveFirstData(data["fullname"]);
    SaveData.saveLastData(data["fullname"]);
    SaveData.saveStringData('email', data["email"]);
    SaveData.saveStringData('user_name', data["username"]);
    SaveData.saveStringData('phone', data["phone"]);
    SaveData.saveStringData('score', data["score"]);
    SaveData.saveStringData('rank', data["rank"]);
    SaveData.saveStringData('total_tests', data["total_tests"]);
  }
}
