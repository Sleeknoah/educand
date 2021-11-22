import 'package:educand/screens/home.dart';
import 'package:educand/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestResults extends StatefulWidget {
  @override
  _TestResultsState createState() => _TestResultsState();
}

class _TestResultsState extends State<TestResults> {
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
        backgroundColor: c8,
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
        color: c8,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                child: Image.asset('assets/images/trophys.png'),
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
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
                child: Text(
                  "We know you're a champion. Practice and test your skills in the practice mode area and attempt again. We know you can do a lot better!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        color: Colors.transparent,
                      ),
                      width: 95,
                      height: 95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 11,
                            height: 11,
                            child: new Image.asset(
                              'assets/images/question@2x.png',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                            ),
                            child: Text(
                              'Questions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 2.0,
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
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        color: Colors.transparent,
                      ),
                      width: 95,
                      height: 95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 11,
                            height: 11,
                            child: new Image.asset(
                              'assets/images/check-circle-o@2x.png',
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
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 2.0,
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
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        color: Colors.transparent,
                      ),
                      width: 95,
                      height: 95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 11,
                            height: 11,
                            child: new Image.asset(
                              'assets/images/close@2x.png',
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
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 2.0,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              new Spacer(),
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
                        clearSharePrefs();
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
