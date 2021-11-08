import 'package:educand/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'practice_home.dart';

class PLevel extends StatefulWidget {
  @override
  _PLevelState createState() => _PLevelState();
}

class _PLevelState extends State<PLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Practice Mode",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        elevation: 0.0,
        // foregroundColor: c7,
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
        backgroundColor: c7,
      ),
      backgroundColor: c7,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Container(
            decoration: BoxDecoration(color: c7),
            padding: EdgeInsets.only(
              top: 12.0,
              left: 12.0,
              right: 12.0,
              bottom: 12.0,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:
                // Card(
                //   elevation: 6.0,
                //   child: Padding(
                //     padding: EdgeInsets.all(16.0),
                //     child:
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Container(
                //   child:
                //       Image.asset('assets/images/plevel_illustration.png'),
                // ),
                Container(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Choose a Practice Mode',
                      style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),

                _listTile(c1, "Standard Mode", "standard"),
                _listTile(c3, "Scrabbled Word Mode", "scrabbled"),
                _listTile(c4, "Missing Word Mode", "incomplete"),
                SizedBox(height: 60.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listTile(Color c, String text, String goto) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child: PHome(mode: goto),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
            decoration: BoxDecoration(
              color: c,
              // padding: EdgeInsets.symmetric(),

              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
            ),
            child: ListTile(
              title: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
}
