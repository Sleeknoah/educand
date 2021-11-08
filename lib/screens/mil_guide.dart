import 'package:educand/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'game_page.dart';

class MilGuide extends StatefulWidget {
  @override
  _MilGuideState createState() => _MilGuideState();
}

class _MilGuideState extends State<MilGuide> {
  TextEditingController fnController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "How to Play",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: c1,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          color: c1,
          padding:
              EdgeInsets.only(top: 0.0, left: 6.0, right: 6.0, bottom: 0.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: Container(
                    child: Center(
                      child: Image.asset(
                        'assets/images/chess.png',
                        width: 250,
                        height: 177,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                    ),
                    child: Text(
                      'How To Play Mil Board Game',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    '1. Each player starts on tab 1 and can only start moving when you roll a 1 on your dice. \n\n 2. Players are moved forward by the number of steps equivalent to the number they rolled on the dice. \n\n 3. Landing on some special tabs may attract rewards or reprimands based on the MIL curriculum.\n\n 4. Each session ends as soon as one player passes tab 100 and that player emerges as the winner of the game. \n\n 5. All reprimands and rewards in the game can be found in the Reprimands and Rewards page',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: Colors.grey[200],
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 16,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: GamePage(),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 14.0,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                "PLAY NOW",
                                style: TextStyle(
                                  color: c1,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
