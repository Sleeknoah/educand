import 'dart:async';

import 'package:educand/screens/verify.dart';
import 'package:educand/utils/text_transparent_decor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/progressdialog.dart';
import '../widgets/submitbutton.dart';

class PhoneScreen extends StatefulWidget {
  final String message;
  PhoneScreen({this.message});

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  String enteredPhoneNumber;

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
      backgroundColor: Colors.white,
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
                      EdgeInsets.only(top: 60, right: 40, left: 40, bottom: 80),
                  child: Image.asset('assets/icon/icon.png',
                      width: 177, height: 98),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: Text(
                    'Enter your phone number',
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 24.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.grey[300]),
                        left: BorderSide(width: 1.0, color: Colors.grey[300]),
                        right: BorderSide(width: 1.0, color: Colors.grey[300]),
                        bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 4),
                          child: Text(
                            '+234',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.grey[700],
                        ),
                        Flexible(
                          child: TextDecorTransparent(
                              s: (newText) {
                                enteredPhoneNumber = newText;
                              },
                              removePadding: true,
                              hint: "Enter phone number"),
                        ),
                      ],
                    ),
                  ),
                ),
                SubmitButton(
                  title: "Submit",
                  act: () async {
                    if (enteredPhoneNumber != null) {
                      // navigate to desired screen
                      _showLoginDialog();
                      http.Response response = await http
                          .post('https://termii.com/api/sms/otp/send', body: {
                        'api_key':
                            'TLMkNEiXK2lgCVcDpiw1v5JfFPeRDleQKJz2yA3afScbmxeNagVzkTaviCnix7',
                        'message_type': 'NUMERIC',
                        'to': enteredPhoneNumber,
                        'from': 'Educand',
                        'channel': 'WhatsApp',
                        'pin_attempts': 10,
                        'pin_time_to_live': 15,
                        'pin_length': 6,
                        'pin_placeholder': '< 1234 >',
                        'message_text': 'Your Educand pin is < 1234 >'
                      });

                      if (response.statusCode == 200 ||
                          response.statusCode == 201) {
                        saveString('phone', enteredPhoneNumber);
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyScreen(),
                          ),
                        );
                      } else {
                        Navigator.of(context).pop();
                        _showErrorDialog("Error sending verification code");
                      }
                    }
                  },
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
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: 15,
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
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Text(
                        "Registering ...",
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

  saveString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  _showSuccessDialog(String text) {
    showDialog(
      context: context,
      // ignore: deprecated_member_use
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        content: Container(
          height: MediaQuery.of(context).size.height / 3.6,
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
                child: Text(
                  "Registration Successful!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                        fontSize: 16,
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
}
