import 'package:educand/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:page_transition/page_transition.dart';

import 'game_page.dart';
import 'mil_guide.dart';
import 'mil_library.dart';

class Mil extends StatefulWidget {
  @override
  _MilState createState() => _MilState();
}

class _MilState extends State<Mil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c30,
      appBar: AppBar(
        title: Text(
          "MIL Board Game",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        elevation: 0.0,
        titleSpacing: 0.0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: c30,
        // foregroundColor: c1,
      ),
      body: Center(
        child: Container(
          padding:
              EdgeInsets.only(top: 0.0, left: 2.0, right: 2.0, bottom: 0.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Image.asset(
                      'assets/images/game.png',
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: GamePage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: GFListTile(
                      title: Text(
                        'Play Now!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.white24,
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 16.0),
                      subtitle: Text(
                        'Start Game Now',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey[100],
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: MilGuide(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: GFListTile(
                      title: Text(
                        'How To Play',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.white24,
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 16.0),
                      subtitle: Text(
                        'Game Rules and Instructions',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey[100],
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: MilLibrary(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: GFListTile(
                      title: Text(
                        'Rewards & Reprimands',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.white24,
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 16.0),
                      subtitle: Text(
                        'Game Rewards and reprimands',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey[100],
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
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
