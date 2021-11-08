import 'package:educand/values/colors.dart';
import 'package:educand/widgets/submitbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'practice_home.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String rank = "";
  String score = "";
  String testTaken = "";

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  Future<void> getDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      rank = preferences.getString("rank") ?? '-';
      score = preferences.getString("score") ?? '-';
      testTaken = preferences.getString("total_test") ?? '-';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: c8,
        elevation: 0.0,
        title: Text(
          "Test Mode",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        titleSpacing: 0.0,
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Container(
                width: MediaQuery.of(context).size.height / 2.5,
                height: MediaQuery.of(context).size.width / 2.5,
                child: new Image.asset(
                  'assets/images/plevel_illustration.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 20,
                        height: 20,
                        child: new Image.asset(
                          'assets/images/medal@2x.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Text(
                          'Your Current \nRank:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "${rank}",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 20,
                        height: 20,
                        child: new Image.asset(
                          'assets/images/beginner@2x.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Text(
                          'Total Test You \nHave Taken:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "${testTaken}",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 20,
                        height: 20,
                        child: new Image.asset(
                          'assets/images/diamond@2x.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Text(
                          'Total Score:\n    ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "${score}",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 24.0,
              ),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white24,
                onPressed: () {
                  //skip
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 1.0,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 0.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              4.0,
                            ),
                            child: Text(
                              "Check Leaderboards",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20.0,
                    ),
                    topRight: Radius.circular(
                      20.0,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 32.0,
                          top: 16.0,
                          bottom: 8.0,
                        ),
                        child: Text(
                          'Instructions',
                          style: TextStyle(
                            color: Color(0xFF2A2828),
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 8.0,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: c2,
                            child: Icon(
                              Icons.help_outline_sharp,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            'The test is to be completed under 2 minutes and the highest score number you can get depends on the questions you answer correctly.',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 8.0,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: c5,
                            child: Icon(
                              Icons.military_tech_outlined,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            '1 mark is awarded for correct answers; no mark for incorrect answers.',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 8.0,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.keyboard,
                              color: Colors.white,
                            ),
                            backgroundColor: c4,
                          ),
                          title: Text(
                            'Enter the correct pronounced words in the space provided.',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: SubmitButton(
                          title: "BEGIN SPELL&THRIL! TEST",
                          act: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PHome(mode: "test"),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _leaderboardDialog() async {
    await showDialog(
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
                Icons.stars,
                size: 56,
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "LEADERBOARD",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map> userProfile() async {
    Map userProfile = await FlutterSession().get("userProfile");
    return userProfile;
  }
}
