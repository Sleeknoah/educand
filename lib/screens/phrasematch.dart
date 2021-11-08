import 'package:educand/screens/spacers.dart';
import 'package:educand/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:page_transition/page_transition.dart';

import 'phrasematch_guide.dart';
import 'phrasematch_home.dart';
import 'phrasematch_library.dart';

class PhraseMatch extends StatefulWidget {
  @override
  _PhraseMatchState createState() => _PhraseMatchState();
}

class _PhraseMatchState extends State<PhraseMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c5,
      appBar: AppBar(
        title: Text(
          "Phrase Match Game",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        elevation: 0.0,
        titleSpacing: 0.0,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 18,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: c5,
        // foregroundColor: c1,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Ymargin(x: 20.0),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Image.asset(
                      'assets/images/Phrase Match.png',
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ),
                ),
                Ymargin(x: 50.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: PhrasematchHome(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                        child: PhrasematchGuide(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                        child: PhrasematchLibrary(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: GFListTile(
                      title: Text(
                        'Resource Library',
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
                        'Read and Download Resource Books',
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
//             "Phrase Match Game",
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
//             padding: EdgeInsets.only(
//                 top: 12.0, left: 2.0, right: 2.0, bottom: 12.0),
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           PageTransition(
//                             type: PageTransitionType.fade,
//                             child: PhrasematchHome(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(5),
//                         child: GFListTile(
//                             titleText: 'Play Now!',
//                             color: Colors.yellow[500],
//                             padding: EdgeInsets.all(35),
//                             subtitleText: 'Start Game Now',
//                             icon: Icon(Icons.arrow_forward_ios)),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           PageTransition(
//                             type: PageTransitionType.fade,
//                             child: PhrasematchGuide(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(5),
//                         child: GFListTile(
//                             titleText: 'How To Play',
//                             color: Colors.yellow[500],
//                             padding: EdgeInsets.all(35),
//                             subtitleText: 'Game Rules and Instructions',
//                             icon: Icon(Icons.arrow_forward_ios)),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           PageTransition(
//                             type: PageTransitionType.fade,
//                             child: PhrasematchLibrary(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(5),
//                         child: GFListTile(
//                             titleText: 'Resource Library',
//                             color: Colors.yellow[500],
//                             padding: EdgeInsets.all(35),
//                             subtitleText: 'Read and Download Resource Books',
//                             icon: Icon(Icons.arrow_forward_ios)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ));
// }
// }
