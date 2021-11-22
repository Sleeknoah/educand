import 'package:educand/widgets/submitbutton.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Competition extends StatefulWidget {
  @override
  _CompetitionState createState() => _CompetitionState();
}

class _CompetitionState extends State<Competition> {
  bool isOpened = false, isBroke = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      new Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16.0,
                          bottom: 50.0,
                        ),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.close,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.height / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  child: new Image.asset(
                    'assets/images/closed.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Text(
                    'Registration is \n currently open!',
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
                  child: Text(
                    'We are currently receiving registrations for Spell&Thrill! Competition. Please click the button to enroll',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6F6F6F),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
                new Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30.0,
                  ),
                  child: SubmitButton(
                    title: "Register Now",
                    act: () async {
                      launch('https://ozmites.com/printing/spell-thrill/');
                    },
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
