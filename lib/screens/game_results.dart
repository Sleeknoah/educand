import 'package:educand/screens/home.dart';
import 'package:educand/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';

class GameResult extends StatefulWidget {
  const GameResult() : super();

  @override
  _GameResultState createState() => _GameResultState();
}

class _GameResultState extends State<GameResult> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _goBack,
      child: Scaffold(
        backgroundColor: c31,
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/bagde_bg.png',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                ),
                Image.asset(
                  'assets/images/trophys.png',
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    bottom: 2.0,
                  ),
                  child: Text(
                    'Great Job!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'You have done it',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Spacer(),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 32.0,
                            left: 16.0,
                            right: 16.0,
                          ),
                          child: GestureDetector(
                            onTap: () => _onShareData(context),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 20,
                                left: 20,
                                bottom: 20,
                              ),
                              child: Container(
                                // padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment(-1.0, 0.0),
                                      end: Alignment(2.0, -2.0),
                                      colors: [
                                        Color(0xFFFF7600),
                                        Color(0xFFFF7600),
                                        Color(0xFFFFB206),
                                        Color(0xFFFFB206),
                                        Color(0xFFFFB206),
                                      ],
                                      stops: [
                                        0.28,
                                        0.38,
                                        0.58,
                                        0.85,
                                        .98,
                                      ]),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.share,
                                        color: Colors.white,
                                        size: 23.0,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        'Share with your friends',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 32.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                      ModalRoute.withName("/Home"));
                                },
                                child: Text(
                                  "Quit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _goBack() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
      ModalRoute.withName("/Home"),
    );
  }

  _onShareData(BuildContext context) async {
    Share.share(
        'Hi check out my score on the Educand Milboard game. Just click the link to see...');
  }
}
