import 'package:educand/screens/home.dart';
import 'package:educand/screens/practice_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PracticeResults extends StatefulWidget {
  final String mode;
  PracticeResults({this.mode});
  @override
  _PracticeResultsState createState() => _PracticeResultsState();
}

class _PracticeResultsState extends State<PracticeResults> {
  String questions = "";
  String correct = "";
  String incorrect = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getScores();
  }

  void getScores() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      questions = preferences.getString("questions") ?? "0";
      correct = preferences.getString("correct") ?? "0";
      incorrect = preferences.getString("incorrect") ?? "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff593F8C),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment
                .bottomCenter, // 10% of the width, so there are ten blinds.
            colors: <Color>[
              Color(0xff593F8C),
              Color(0xff863287),
              Color(0xffDD1A7C)
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                child: Image.asset('assets/images/test_result.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Text(
                  "Nice you have done it!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: 13,
                          height: 13,
                          child: new Image.asset(
                            'assets/images/question@2x.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: Text(
                            "${questions}",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: Text(
                            'Question',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 13,
                          height: 13,
                          child: new Image.asset(
                            'assets/images/check-circle-o@2x.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: Text(
                            "${correct}",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: Text(
                            'Correct',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 13,
                          height: 13,
                          child: new Image.asset(
                            'assets/images/close@2x.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: Text(
                            "${incorrect}",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: Text(
                            'Incorrect',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Colors.transparent,
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
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PHome(
                                mode: widget.mode,
                              ),
                            ),
                            ModalRoute.withName("/Home"));
                        clearSharePrefs();
                      },
                      child: Text(
                        "TAKE IT AGAIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                            ModalRoute.withName("/Home"));
                        clearSharePrefs();
                      },
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
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
    );
  }

  _onShareData(BuildContext context) async {
    Share.share(
        'Hi check out my score on the Educand SPELL&THRILL test. Just click the link to see...');
  }

  clearSharePrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("question");
    preferences.remove("correct");
    preferences.remove("incorrect");
  }
}
