import 'package:educand/screens/profilepage.dart';
import 'package:educand/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'account.dart';
import 'competition.dart';
import 'mil.dart';
import 'practice.dart';
import 'test.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  Future<Map> myuserProfile;
  String s = '';
  String name = "";

  @override
  void initState() {
    super.initState();
    // FlutterSession().get('userProfile').then((value) => s = value);
    getCred();
  }

  void getCred() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString("first_name");
    });
  }

  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    myuserProfile = userProfile();

    return Scaffold(
      key: _scaffoldKey,
      // drawer: Drawer(child: leftDrawerMenu()),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 5,
                    right: 20,
                    left: 20,
                  ),
                  child: buildAppBar(context),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: Practice(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                      ),
                      child: Container(
                        // padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: c3,
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 12),

                        child: ListTile(
                          leading: Icon(
                            Icons.star_border_outlined,
                            color: Colors.white,
                            size: 42.0,
                          ),
                          title: Text(
                            'SPELL&THRILL! Practice',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          subtitle: Text(
                            'Practice and test your skills',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey[100],
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // icon: Icon(Icons.arrow_forward_ios)),
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       PageTransition(
                    //         type: PageTransitionType.fade,
                    //         child: Mil(),
                    //       ),
                    //     );
                    //   },
                    //   child: Container(
                    //     padding: EdgeInsets.all(0),
                    //     child: GFListTile(
                    //         titleText: 'MIL Board Game',
                    //         color: Colors.white,
                    //         padding: EdgeInsets.all(27),
                    //         subtitleText: 'Play and Learn about MIL',
                    //         icon: Icon(Icons.arrow_forward_ios)),
                    //   ),
                    // ),
                    // GestureDetector(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     PageTransition(
                    //       type: PageTransitionType.fade,
                    //       child: PhraseMatch(),
                    //     ),
                    //   );
                    // },
                    // child: Container(
                    //   padding: EdgeInsets.all(0),
                    //   child: GFListTile(
                    //       titleText: 'Phrase Match Game',
                    //       color: Colors.yellow[500],
                    //       padding: EdgeInsets.all(27),
                    //       subtitleText: 'Connect Phrases with Books',
                    //       icon: Icon(Icons.arrow_forward_ios)),
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: Mil(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                      ),
                      child: Container(
                        // padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Mil board.png"),
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 42, horizontal: 12),

                        child: ListTile(
                          leading: SizedBox(
                            height: 32,
                            width: 32,
                          ),
                          title: Text(
                            'MIL Board Game',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          subtitle: Text(
                            'Play and Learn about MIL',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey[100],
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // icon: Icon(Icons.arrow_forward_ios)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      _showToast(context);
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     type: PageTransitionType.fade,
                      //     child: PhraseMatch(),
                      //   ),
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                      ),
                      child: Container(
                        // padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: c4,
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 12),

                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.puzzlePiece,
                            color: Colors.white,
                            size: 32.0,
                          ),
                          title: Text(
                            'Phrase Match Game',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          subtitle: Text(
                            'Connect Phrases with books',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey[100],
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // icon: Icon(Icons.arrow_forward_ios)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      _showToast(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                      ),
                      child: Container(
                        // padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/competition.png"),
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 42, horizontal: 12),

                        child: Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: ListTile(
                            title: Text(
                              'Spell&Thrill!\nCompetition',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            subtitle: Text(
                              'Compete on the biggest stage',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey[100],
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            // icon: Icon(Icons.arrow_forward_ios)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          border: Border.all(color: c8),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: Color(0xA0087C5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                color: c8,
                                size: 23.0,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                'SHARE THE APP',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: c8,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        backgroundColor: c8,
        selectedItemColor: c1,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        onTap: (s) {
          if (s != 0) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: s == 3
                    ? Account()
                    : s == 2
                        ? Competition()
                        : Test(),
              ),
            );
          }
        },
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.import_contacts_rounded,
            ),
            label: "Take Test",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.military_tech_outlined,
            ),
            label: ("Competitions"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
            ),
            label: ("Account"),
          ),
        ],
      ),
    );
  }

  Row buildAppBar(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            bottom: 10.0,
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Hello',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                ' ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "${name},",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        new Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: ProfilePage(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 8.0, bottom: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xFF0087C5),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.person_rounded,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              )),
        ),
      ],
    );
  }

  // leftDrawerMenu() {
  //   Color blackColor = Colors.black.withOpacity(0.6);
  //   return FutureBuilder<Map>(
  //       future: userProfile(),
  //       builder: (context, AsyncSnapshot<Map> snapshot) {
  //         if (snapshot.hasData) {
  //           Map userProfile = snapshot.data;
  //           return Container(
  //             child: ListView(
  //               padding: EdgeInsets.zero,
  //               children: <Widget>[
  //                 Container(
  //                   padding: EdgeInsets.symmetric(vertical: 16.0),
  //                   height: 150,
  //                   child: DrawerHeader(
  //                     child: ListTile(
  //                       trailing: GestureDetector(
  //                         onTap: () {
  //                           Navigator.push(
  //                             context,
  //                             PageTransition(
  //                               type: PageTransitionType.fade,
  //                               child: Profile(),
  //                             ),
  //                           );
  //                         },
  //                         child: Icon(
  //                           Icons.chevron_right,
  //                           size: 28,
  //                         ),
  //                       ),
  //                       subtitle: GestureDetector(
  //                         onTap: () {
  //                           Navigator.push(
  //                             context,
  //                             PageTransition(
  //                               type: PageTransitionType.fade,
  //                               child: Profile(),
  //                             ),
  //                           );
  //                         },
  //                         child: Text(
  //                           "View Profile",
  //                           style: TextStyle(
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.w500,
  //                               color: blackColor),
  //                         ),
  //                       ),
  //                       title: GestureDetector(
  //                         onTap: () {
  //                           Navigator.push(
  //                             context,
  //                             PageTransition(
  //                               type: PageTransitionType.fade,
  //                               child: Profile(),
  //                             ),
  //                           );
  //                         },
  //                         child: Text(
  //                           userProfile["username"],
  //                           style: TextStyle(
  //                               fontSize: 16,
  //                               fontWeight: FontWeight.w600,
  //                               color: blackColor),
  //                         ),
  //                       ),
  //                       leading: CircleAvatar(
  //                         backgroundImage: NetworkImage(
  //                             'https://ipsm.org.ng/educand/' +
  //                                 userProfile["photo"]),
  //                       ),
  //                     ),
  //                     decoration: BoxDecoration(
  //                       color: Color(0xFFF8FAFB),
  //                     ),
  //                   ),
  //                 ),
  //                 ListTile(
  //                   leading: Icon(
  //                     Icons.home,
  //                     color: blackColor,
  //                   ),
  //                   title: Text(
  //                     'Home',
  //                     style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w600,
  //                         color: blackColor),
  //                   ),
  //                   onTap: () {
  //                     Navigator.push(
  //                       context,
  //                       PageTransition(
  //                         type: PageTransitionType.fade,
  //                         child: Home(),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //                 ListTile(
  //                   leading: Icon(Icons.add_circle_outline, color: blackColor),
  //                   title: Text('Spelling Practice Mode',
  //                       style: TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w600,
  //                           color: blackColor)),
  //                   onTap: () {
  //                     Navigator.push(
  //                       context,
  //                       PageTransition(
  //                         type: PageTransitionType.fade,
  //                         child: Practice(),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //                 ListTile(
  //                   leading: Icon(Icons.games, color: blackColor),
  //                   title: Text('Spelling Test Mode',
  //                       style: TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w600,
  //                           color: blackColor)),
  //                   onTap: () {
  //                     Navigator.push(
  //                       context,
  //                       PageTransition(
  //                         type: PageTransitionType.fade,
  //                         child: Test(),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //                 ListTile(
  //                   leading: Icon(Icons.compare, color: blackColor),
  //                   title: Text('Competitions',
  //                       style: TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w600,
  //                           color: blackColor)),
  //                   onTap: () {
  //                     Nav.route(context, Competition());
  //                   },
  //                 ),
  //                 ListTile(
  //                   leading: Icon(Icons.library_books, color: blackColor),
  //                   title: Text('Phrase Match Game',
  //                       style: TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w600,
  //                           color: blackColor)),
  //                   onTap: () {
  //                     Navigator.push(
  //                       context,
  //                       PageTransition(
  //                         type: PageTransitionType.fade,
  //                         child: PhraseMatch(),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //                 ListTile(
  //                   leading: Icon(Icons.developer_board, color: blackColor),
  //                   title: Text('MIL Board Game',
  //                       style: TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w600,
  //                           color: blackColor)),
  //                   onTap: () {
  //                     Navigator.push(
  //                       context,
  //                       PageTransition(
  //                         type: PageTransitionType.fade,
  //                         child: Mil(),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //                 ListTile(
  //                   leading: Icon(Icons.face, color: blackColor),
  //                   title: Text('My Profile',
  //                       style: TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w600,
  //                           color: blackColor)),
  //                   onTap: () {
  //                     Nav.route(
  //                       context,
  //                       Profile(),
  //                     );
  //                   },
  //                 ),
  //                 ListTile(
  //                   leading: Icon(Icons.help, color: blackColor),
  //                   title: Text('Support',
  //                       style: TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w600,
  //                           color: blackColor)),
  //                   onTap: () {
  //                     Nav.route(context, Support());
  //                   },
  //                 ),
  //                 ListTile(
  //                   leading: Icon(Icons.question_answer, color: blackColor),
  //                   title: Text('FAQs',
  //                       style: TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w600,
  //                           color: blackColor)),
  //                   onTap: () {
  //                     Nav.route(context, Faq());
  //                   },
  //                 ),
  //                 ListTile(
  //                   leading: Icon(Icons.exit_to_app, color: blackColor),
  //                   title: Text('Logout',
  //                       style: TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w600,
  //                           color: blackColor)),
  //                   onTap: () {
  //                     Nav.route(context, LoginScreen());
  //                   },
  //                 ),
  //               ],
  //             ),
  //           );
  //         } else {}
  //       });
  // }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Coming soon...'),
      ),
    );
  }

  _onShareData(BuildContext context) async {
    Share.share(
        'Hi there join me on this amazing app Educand. Just click the link to register...');
  }

  Future<Map> userProfile() async {
    Map userProfile = await FlutterSession().get("userProfile");
    return userProfile;
  }
}
