import 'package:educand/screens/phrasematch_home.dart';
import 'package:educand/values/colors.dart';
import 'package:educand/widgets/submitbutton.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PhrasematchGuide extends StatefulWidget {
  @override
  _PhrasematchGuideState createState() => _PhrasematchGuideState();
}

class _PhrasematchGuideState extends State<PhrasematchGuide> {
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
        backgroundColor: c5,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          color: c5,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Image.asset(
                      'assets/images/practice_illustration.png',
                      width: 250,
                      height: 177,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 5,
                    left: 16,
                  ),
                  child: Text(
                    'How To Play Phrase Match',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Text(
                    '1. Each PhraseMatch session is comprised of a set of phrases drawn out of the weekly reading resource. \n\n 2. Players are meant to go through the PhraseMatch resource library to acquiant themselves with the texts for the week. \n\n 3. Each successfully matched phrase increases your overall score as you proceed through each session.\n\n 4. Each session is due to end once the session time is up or when the PhraseMatch entries are completed.',
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
                  padding: const EdgeInsets.all(16.0),
                  child: SubmitButton(
                    title: "PLAY NOW",
                    removePadding: true,
                    act: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: PhrasematchHome(),
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
    );

    //   return Container(
    //       decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //               begin: Alignment.centerLeft,
    //               end: Alignment.centerRight,
    //               colors: [Colors.purple, Colors.blue[700]])),
    //       child: Scaffold(
    //         backgroundColor: Colors.transparent,
    //         appBar: AppBar(
    //           title: Text(
    //             "How to Play",
    //             style: TextStyle(color: Colors.black, fontSize: 16),
    //           ),
    //           leading: IconButton(
    //             icon: Icon(Icons.arrow_back_ios, color: Colors.black),
    //             onPressed: () => Navigator.pop(context),
    //           ),
    //           backgroundColor: Colors.white,
    //         ),
    //         body: Center(
    //           child: Container(
    //             padding:
    //                 EdgeInsets.only(top: 2.0, left: 6.0, right: 6.0, bottom: 2.0),
    //             height: MediaQuery.of(context).size.height,
    //             width: MediaQuery.of(context).size.width,
    //             child: Card(
    //               color: Colors.white30,
    //               elevation: 6.0,
    //               child: Padding(
    //                 padding: EdgeInsets.all(16.0),
    //                 child: SingleChildScrollView(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: <Widget>[
    //                       Container(
    //                         child: Image.asset(
    //                             'assets/images/practice_illustration.png'),
    //                       ),
    //                       Container(
    //                         padding: EdgeInsets.only(
    //                           top: 15,
    //                           bottom: 5,
    //                         ),
    //                         child: Center(
    //                           child: Text(
    //                             'How To Play Phrase Match',
    //                             style: TextStyle(
    //                               fontWeight: FontWeight.normal,
    //                               fontSize: 20,
    //                               fontFamily: 'Ubuntu',
    //                               color: Colors.white,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       Container(
    //                           padding: EdgeInsets.all(10),
    //                           child: Text(
    //                               '1. Each PhraseMatch session is comprised of a set of phrases drawn out of the weekly reading resource. \n\n 2. Players are meant to go through the PhraseMatch resource library to acquiant themselves with the texts for the week. \n\n 3. Each successfully matched phrase increases your overall score as you proceed through each session.\n\n 4. Each session is due to end once the session time is up or when the PhraseMatch entries are completed.',
    //                               style: TextStyle(
    //                                 color: Colors.white,
    //                               ))),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ));
  }
}
