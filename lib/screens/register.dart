import 'package:educand/utils/text_filed_decor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login.dart';
import '../widgets/submitbutton.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String fullNameText;
  String usernameText;
  String emailText;
  String passwordText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
                      EdgeInsets.only(top: 20, right: 40, left: 40, bottom: 10),
                  child: Image.asset('assets/icon/icon.png',
                      width: 177, height: 98),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 60,
                  ),
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
                  ),
                ),

                TextDecor(
                  hint: "Full name",
                  s: (newText) {
                    fullNameText = newText;
                  },
                  isWithLabel: true,
                ),
                TextDecor(
                  hint: "Username",
                  s: (newText) {
                    usernameText = newText;
                  },
                  isWithLabel: true,
                ),
                TextDecor(
                  hint: "Email",
                  isObscure: false,
                  s: (newText) {
                    emailText = newText;
                  },
                  isWithLabel: true,
                ),
                TextDecor(
                  hint: "Password",
                  isObscure: true,
                  s: (newText) {
                    passwordText = newText;
                  },
                  isWithLabel: true,
                ),
                // Container(
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         bottom: 8.0, left: 24.0, right: 24.0),
                //     child: TextField(
                //       onChanged: (newText) {
                //         fullNameText = newText;
                //       },
                //       maxLength: 50,
                //       textAlign: TextAlign.left,
                //       keyboardType: TextInputType.text,
                //       decoration: InputDecoration(
                //         fillColor: Theme.of(context).dividerColor,
                //         labelText: "Full Name",
                //         labelStyle: TextStyle(
                //           color: Theme.of(context).primaryColor,
                //           fontSize: 15,
                //         ),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: BorderSide(
                //             width: 0,
                //             style: BorderStyle.none,
                //           ),
                //         ),
                //         filled: true,
                //         contentPadding: EdgeInsets.all(16),
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         bottom: 8.0, left: 24.0, right: 24.0),
                //     child: TextField(
                //       onChanged: (newText) {
                //         usernameText = newText;
                //       },
                //       maxLength: 10,
                //       textAlign: TextAlign.left,
                //       keyboardType: TextInputType.text,
                //       decoration: InputDecoration(
                //         fillColor: Theme.of(context).dividerColor,
                //         labelText: "Username",
                //         labelStyle: TextStyle(
                //           color: Theme.of(context).primaryColor,
                //           fontSize: 15,
                //         ),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: BorderSide(
                //             width: 0,
                //             style: BorderStyle.none,
                //           ),
                //         ),
                //         filled: true,
                //         contentPadding: EdgeInsets.all(16),
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         bottom: 8.0, left: 24.0, right: 24.0),
                //     child: TextField(
                //       onChanged: (newText) {
                //         emailText = newText;
                //       },
                //       maxLength: 50,
                //       textAlign: TextAlign.left,
                //       keyboardType: TextInputType.emailAddress,
                //       decoration: InputDecoration(
                //         fillColor: Theme.of(context).dividerColor,
                //         labelText: "Email Address",
                //         labelStyle: TextStyle(
                //           color: Theme.of(context).primaryColor,
                //           fontSize: 15,
                //         ),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: BorderSide(
                //             width: 0,
                //             style: BorderStyle.none,
                //           ),
                //         ),
                //         filled: true,
                //         contentPadding: EdgeInsets.all(16),
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         bottom: 8.0, left: 24.0, right: 24.0),
                //     child: TextField(
                //       onChanged: (newText) {
                //         passwordText = newText;
                //       },
                //       obscureText: true,
                //       maxLength: 10,
                //       textAlign: TextAlign.left,
                //       keyboardType: TextInputType.visiblePassword,
                //       decoration: InputDecoration(
                //         fillColor: Theme.of(context).dividerColor,
                //         labelText: "Password",
                //         labelStyle: TextStyle(
                //           color: Theme.of(context).primaryColor,
                //           fontSize: 15,
                //         ),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: BorderSide(
                //             width: 0,
                //             style: BorderStyle.none,
                //           ),
                //         ),
                //         filled: true,
                //         contentPadding: EdgeInsets.all(16),
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         bottom: 8.0, left: 24.0, right: 24.0),
                //     child: TextField(
                //       onChanged: (newText) {
                //         passwordText2 = newText;
                //       },
                //       obscureText: true,
                //       maxLength: 10,
                //       textAlign: TextAlign.left,
                //       keyboardType: TextInputType.visiblePassword,
                //       decoration: InputDecoration(
                //         fillColor: Theme.of(context).dividerColor,
                //         labelText: "Repeat Password",
                //         labelStyle: TextStyle(
                //           color: Theme.of(context).primaryColor,
                //           fontSize: 15,
                //         ),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: BorderSide(
                //             width: 0,
                //             style: BorderStyle.none,
                //           ),
                //         ),
                //         filled: true,
                //         contentPadding: EdgeInsets.all(16),
                //       ),
                //     ),
                //   ),
                // ),
                SubmitButton(
                  title: "Register",
                  act: () async {
                    if (fullNameText != null &&
                        usernameText != null &&
                        emailText != null &&
                        passwordText != null) {
                      _showRegDialog();

                      http.Response response = await http.post(
                          'https://ipsm.org.ng/educand/process_register.php',
                          body: {
                            'fullname': fullNameText,
                            'username': usernameText,
                            'email': emailText,
                            'password': passwordText,
                          });
                      if (response.statusCode == 200) {
                        print(response.body);
                        if (response.body == "success") {
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LoginScreen(message: "Registered"),
                            ),
                          );
                        } else if (response.body == "userexists") {
                          Navigator.of(context).pop();
                          _showErrorDialog("Username already in use!");
                        } else if (response.body == "emailexists") {
                          Navigator.of(context).pop();
                          _showErrorDialog("Email already in use!");
                        }
                      } else {
                        print(
                            'Request failed with status: ${response.statusCode}.');
                        Navigator.of(context).pop();
                        _showErrorDialog("Connection Error!");
                      }
                    } else {
                      _showErrorDialog("Incomplete Details!");
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Account already exists? ",
                        style: TextStyle(fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                width: MediaQuery.of(context).size.width,
                child: Row(children: <Widget>[
                  Center(
                    child: Icon(Icons.error, size: 60, color: Colors.redAccent),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15, left: 15),
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

  getSavedString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  _showRegDialog() {
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
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Text(
                        "Processing ...",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ]),
              ),
            ));
  }
}
