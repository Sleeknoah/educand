import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:educand/screens/home.dart';
import 'package:educand/utils/text_filed_decor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'design_course_app_theme.dart';
import '../widgets/submitbutton.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final double infoHeight = 364.0;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;

  final fnController1 = TextEditingController();
  final fnController2 = TextEditingController();
  final fnController3 = TextEditingController();
  final fnController4 = TextEditingController();
  final fnController5 = TextEditingController();

  bool _fnEnabled1 = false;
  bool _fnEnabled2 = false;
  bool _fnEnabled3 = true;
  bool _fnEnabled4 = true;
  bool _fnEnabled5 = true;
  bool _fnFilled1 = true;
  bool _fnFilled2 = true;
  bool _fnFilled3 = true;
  bool _fnFilled4 = true;
  bool _fnFilled5 = true;
  bool _obscureText = true;
  Color _fnColor1 = Colors.white70;
  Color _fnColor2 = Colors.white70;
  Color _fnColor3 = Colors.white70;
  Color _fnColor4 = Colors.white70;
  Color _fnColor5 = Colors.white70;

  int _rebuildcount = 0;
  File _image;
  Future<Map> myuserProfile;

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    myuserProfile = userProfile();

    return FutureBuilder<Map>(
        future: myuserProfile,
        builder: (context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map userProfile = snapshot.data;
            if (_rebuildcount == 0) {
              fnController1.text = userProfile["fullname"];
              fnController2.text = userProfile["username"];
              fnController3.text = userProfile["email"];
              fnController4.text = userProfile["phone"];
              fnController5.text = userProfile["password"];
            }

            Future _getImage() async {
              var image =
                  await ImagePicker.pickImage(source: ImageSource.gallery);
              setState(() {
                _image = image;
              });
              _showDialog();
              Dio dio = new Dio();
              FormData formdata = new FormData(); // just like JS
              formdata.add("photo",
                  new UploadFileInfo(_image, path.basename(_image.path)));
              formdata.add("action", "image");
              formdata.add("millis", new DateTime.now().millisecondsSinceEpoch);
              formdata.add("username", userProfile["username"]);
              dio
                  .post("https://ipsm.org.ng/educand/set_profile.php",
                      data: formdata,
                      options: Options(
                          method: 'POST',
                          responseType:
                              ResponseType.PLAIN // or ResponseType.JSON
                          ))
                  .then((response) async {
                if (response.data == "success") {
                  http.Response response2 = await http.post(
                      'https://ipsm.org.ng/educand/get_profile.php',
                      body: {
                        'username': fnController2.text,
                      });
                  await FlutterSession().set("userProfile", response2.body);
                  setState(() {
                    myuserProfile = myuserProfile;
                  });
                  print("setState");
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  _showSuccessDialog("Profile Picture Uploaded!");
                }
              });
            }

            _uploadDialog() async {
              showDialog(
                context: context,
                // ignore: deprecated_member_use
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  content: Container(
                    height: MediaQuery.of(context).size.height / 3.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.cloud_upload,
                          size: 100,
                          color: Theme.of(context).primaryColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: Text(
                              "Select A File to Upload",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          color: Colors.grey,
                          onPressed: () => {_getImage()},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 5.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "SELECT FILE FROM DEVICE",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ).then((value) {});
            }

            return Scaffold(
              backgroundColor: Colors.blue[700],
              body: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1.0,
                        child: Image.network('https://ipsm.org.ng/educand/' +
                            userProfile["photo"]),
                      ),
                    ],
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: DesignCourseAppTheme.nearlyWhite
                                  .withOpacity(0),
                              offset: const Offset(1.1, 1.1),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          top: 22,
                        ),
                        child: SingleChildScrollView(
                          child: Column(children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: 15,
                                  left: 24.0,
                                ),
                                child: Text(
                                  'My Profile',
                                  style: TextStyle(
                                    // fontWeight: FontWeight.normal,
                                    fontSize: 20, fontWeight: FontWeight.w600,
                                    fontFamily: 'Ubuntu',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 23,
                                left: 23,
                              ),
                              child: TextDecor(
                                  isEnabled: false,
                                  isWithLabel: true,
                                  removePadding: true,
                                  txtE: fnController1,
                                  hint: "FULLNAME"),
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                right: 23,
                                left: 23,
                              ),
                              child: TextDecor(
                                  isEnabled: false,
                                  removePadding: true,
                                  isWithLabel: true,
                                  txtE: fnController2,
                                  hint: "USERNAME"),

                              //    Row(children: <Widget>[
                              //     Padding(
                              //       padding: const EdgeInsets.only(
                              //         bottom: 8.0,
                              //         left: 0.0,
                              //         right: 0.0,
                              //       ),
                              //       child: Container(
                              //         width: MediaQuery.of(context).size.width *
                              //             0.67,
                              //         child: TextField(
                              //           style: TextStyle(
                              //             color: Colors.grey,
                              //             fontSize: 15,
                              //           ),
                              //           textAlign: TextAlign.left,
                              //           enabled: _fnEnabled1,
                              //           controller: fnController1,
                              //           keyboardType: TextInputType.text,
                              //           decoration: InputDecoration(
                              //             fillColor:
                              //                 Theme.of(context).dividerColor,
                              //             labelText: "FULLNAME",
                              //             labelStyle: TextStyle(
                              //               color: Theme.of(context).primaryColor,
                              //               fontSize: 10,
                              //             ),
                              //             border: OutlineInputBorder(
                              //               borderRadius:
                              //                   BorderRadius.circular(5),
                              //               borderSide: BorderSide(
                              //                 width: 1,
                              //                 style: BorderStyle.solid,
                              //                 color: Colors.grey,
                              //               ),
                              //             ),
                              //             filled: _fnFilled1,
                              //             contentPadding: EdgeInsets.all(16),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              // //     Padding(
                              // //       padding: const EdgeInsets.only(
                              // //         bottom: 8.0,
                              // //         left: 0.0,
                              // //         right: 0.0,
                              // //       ),
                              // //       child: Card(
                              // //         color: _fnColor1,
                              // //         child: IconButton(
                              // //           onPressed: () {
                              // //             setState(() {});
                              // //           },
                              // //           icon: Icon(
                              // //             Icons.edit,
                              // //             color: Colors.grey,
                              // //           ),
                              // //         ),
                              // //       ),
                              // //     ),
                              //   ]),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //     right: 23,
                            //     left: 23,
                            //   ),
                            //   child: Row(children: <Widget>[
                            //     Padding(
                            //       padding: const EdgeInsets.only(
                            //         bottom: 8.0,
                            //         left: 0.0,
                            //         right: 0.0,
                            //       ),
                            //       child: Container(
                            //         width: MediaQuery.of(context).size.width *
                            //             0.67,
                            //         child: TextField(
                            //           style: TextStyle(
                            //             color: Colors.grey,
                            //             fontSize: 15,
                            //           ),
                            //           textAlign: TextAlign.left,
                            //           enabled: _fnEnabled2,
                            //           controller: fnController2,
                            //           keyboardType: TextInputType.text,
                            //           decoration: InputDecoration(
                            //             fillColor:
                            //                 Theme.of(context).dividerColor,
                            //             labelText: "USERNAME",
                            //             labelStyle: TextStyle(
                            //               color: Theme.of(context).primaryColor,
                            //               fontSize: 10,
                            //             ),
                            //             border: OutlineInputBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(5),
                            //               borderSide: BorderSide(
                            //                 width: 1,
                            //                 style: BorderStyle.solid,
                            //                 color: Colors.grey,
                            //               ),
                            //             ),
                            //             filled: _fnFilled2,
                            //             contentPadding: EdgeInsets.all(16),
                            //           ),
                            //         ),
                            //       ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     bottom: 8.0,
                            //     left: 0.0,
                            //     right: 0.0,
                            //   ),
                            //   child: Card(
                            //     color: _fnColor2,
                            //     child: IconButton(
                            //       onPressed: () {
                            //         setState(() {});
                            //       },
                            //       icon: Icon(
                            //         Icons.edit,
                            //         color: Colors.grey,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // ]),
                            // ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 23,
                                left: 23,
                              ),
                              child: TextDecor(
                                  removePadding: true,
                                  isEnabled: true,
                                  isWithLabel: true,
                                  txtE: fnController3,
                                  hint: "EMAIL ADDRESS"),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //     right: 23,
                            //     left: 23,
                            //   ),
                            //   child: Row(children: <Widget>[
                            //     Padding(
                            //       padding: const EdgeInsets.only(
                            //         bottom: 8.0,
                            //         left: 0.0,
                            //         right: 0.0,
                            //       ),
                            //       child: Container(
                            //         width: MediaQuery.of(context).size.width *
                            //             0.67,
                            //         child: TextField(
                            //           style: TextStyle(
                            //             color: Colors.grey,
                            //             fontSize: 15,
                            //           ),
                            //           textAlign: TextAlign.left,
                            //           enabled: _fnEnabled3,
                            //           controller: fnController3,
                            //           keyboardType: TextInputType.emailAddress,
                            //           decoration: InputDecoration(
                            //             fillColor:
                            //                 Theme.of(context).dividerColor,
                            //             labelText: "EMAIL ADDRESS",
                            //             labelStyle: TextStyle(
                            //               color: Theme.of(context).primaryColor,
                            //               fontSize: 10,
                            //             ),
                            //             border: OutlineInputBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(5),
                            //               borderSide: BorderSide(
                            //                 width: 1,
                            //                 style: BorderStyle.solid,
                            //                 color: Colors.grey,
                            //               ),
                            //             ),
                            //             filled: _fnFilled3,
                            //             contentPadding: EdgeInsets.all(16),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     bottom: 8.0,
                            //     left: 0.0,
                            //     right: 0.0,
                            //   ),
                            //   child: Card(
                            //     color: _fnColor3,
                            //     child: IconButton(
                            //       onPressed: () {
                            //         setState(() {
                            //           if (_fnEnabled3 == false) {
                            //             _fnEnabled3 = true;
                            //             _fnFilled3 = false;
                            //             _fnColor3 = Colors.white;
                            //             _rebuildcount++;
                            //           } else {
                            //             _fnEnabled3 = false;
                            //             _fnFilled3 = true;
                            //             _fnColor3 = Colors.white70;
                            //           }
                            //         });
                            //       },
                            //       icon: Icon(
                            //         Icons.edit,
                            //         color: Theme.of(context).primaryColor,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // ]),
                            // ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 23,
                                left: 23,
                              ),
                              child: TextDecor(
                                  removePadding: true,
                                  isEnabled: true,
                                  isWithLabel: true,
                                  txtE: fnController4,
                                  hint: "PHONE NUMBER"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 23,
                                left: 23,
                              ),
                              child: TextDecor(
                                  removePadding: true,
                                  isEnabled: true,
                                  isWithLabel: true,
                                  isObscure: true,
                                  txtE: fnController5,
                                  hint: "PASSWORD"),
                            ),

                            // Padding(
                            //   padding: EdgeInsets.only(
                            //     right: 23,
                            //     left: 23,
                            //   ),
                            //   child: Row(children: <Widget>[
                            //     Padding(
                            //       padding: const EdgeInsets.only(
                            //         bottom: 8.0,
                            //         left: 0.0,
                            //         right: 0.0,
                            //       ),
                            //       child: Container(
                            //         width: MediaQuery.of(context).size.width *
                            //             0.67,
                            //         child: TextField(
                            //           style: TextStyle(
                            //             color: Colors.grey,
                            //             fontSize: 15,
                            //           ),
                            //           textAlign: TextAlign.left,
                            //           enabled: _fnEnabled4,
                            //           controller: fnController4,
                            //           keyboardType: TextInputType.phone,
                            //           decoration: InputDecoration(
                            //             fillColor:
                            //                 Theme.of(context).dividerColor,
                            //             labelText: "PHONE NUMBER",
                            //             labelStyle: TextStyle(
                            //               color: Theme.of(context).primaryColor,
                            //               fontSize: 10,
                            //             ),
                            //             border: OutlineInputBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(5),
                            //               borderSide: BorderSide(
                            //                 width: 1,
                            //                 style: BorderStyle.solid,
                            //                 color: Colors.grey,
                            //               ),
                            //             ),
                            //             filled: _fnFilled4,
                            //             contentPadding: EdgeInsets.all(16),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     bottom: 8.0,
                            //     left: 0.0,
                            //     right: 0.0,
                            //   ),
                            //   child: Card(
                            //     color: _fnColor4,
                            //     child: IconButton(
                            //       onPressed: () {
                            //         setState(() {
                            //           if (_fnEnabled4 == false) {
                            //             _fnEnabled4 = true;
                            //             _fnFilled4 = false;
                            //             _fnColor4 = Colors.white;
                            //             _rebuildcount++;
                            //           } else {
                            //             _fnEnabled4 = false;
                            //             _fnFilled4 = true;
                            //             _fnColor4 = Colors.white70;
                            //           }
                            //         });
                            //       },
                            //       icon: Icon(
                            //         Icons.edit,
                            //         color: Theme.of(context).primaryColor,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            //   ]),
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //     right: 23,
                            //     left: 23,
                            //   ),
                            //   child: Row(children: <Widget>[
                            //     Padding(
                            //       padding: const EdgeInsets.only(
                            //         bottom: 8.0,
                            //         left: 0.0,
                            //         right: 0.0,
                            //       ),
                            //       child: Container(
                            //         width: MediaQuery.of(context).size.width *
                            //             0.67,
                            //         child: TextField(
                            //           style: TextStyle(
                            //             color: Colors.grey,
                            //             fontSize: 15,
                            //           ),
                            //           textAlign: TextAlign.left,
                            //           enabled: _fnEnabled5,
                            //           obscureText: _obscureText,
                            //           controller: fnController5,
                            //           keyboardType: TextInputType.text,
                            //           decoration: InputDecoration(
                            //             fillColor:
                            //                 Theme.of(context).dividerColor,
                            //             labelText: "PASSWORD",
                            //             labelStyle: TextStyle(
                            //               color: Theme.of(context).primaryColor,
                            //               fontSize: 10,
                            //             ),
                            //             border: OutlineInputBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(5),
                            //               borderSide: BorderSide(
                            //                 width: 1,
                            //                 style: BorderStyle.solid,
                            //                 color: Colors.grey,
                            //               ),
                            //             ),
                            //             filled: _fnFilled5,
                            //             contentPadding: EdgeInsets.all(16),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     bottom: 8.0,
                            //     left: 0.0,
                            //     right: 0.0,
                            //   ),
                            //   child: Card(
                            //     color: _fnColor5,
                            //     child: IconButton(
                            //       onPressed: () {
                            //         setState(() {
                            //           if (_fnEnabled5 == false) {
                            //             _fnEnabled5 = true;
                            //             _fnFilled5 = false;
                            //             _fnColor5 = Colors.white;
                            //             _obscureText = false;
                            //             _rebuildcount++;
                            //           } else {
                            //             _fnEnabled5 = false;
                            //             _fnFilled5 = true;
                            //             _fnColor5 = Colors.white70;
                            //             _obscureText = true;
                            //           }
                            //         });
                            //       },
                            //       icon: Icon(
                            //         Icons.edit,
                            //         color: Theme.of(context).primaryColor,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            //   ]),
                            // ),
                            SubmitButton(
                              act: () async {
                                if (fnController1.text != null &&
                                    fnController2.text != null &&
                                    fnController3.text != null &&
                                    fnController4.text != null &&
                                    fnController5.text != null) {
                                  _showDialog();

                                  Map userProfile =
                                      await FlutterSession().get("userProfile");

                                  http.Response response = await http.post(
                                      'https://ipsm.org.ng/educand/set_profile.php',
                                      body: {
                                        'fullname': fnController1.text,
                                        'username': fnController2.text,
                                        'email': fnController3.text,
                                        'phone': fnController4.text,
                                        'password': fnController5.text,
                                        'score': userProfile["score"],
                                        'rank': userProfile["rank"],
                                        'total_tests':
                                            userProfile["total_tests"],
                                      });
                                  if (response.statusCode == 200) {
                                    print(response.body);
                                    if (response.body == "success") {
                                      Navigator.of(context).pop();
                                      _showSuccessDialog(
                                          "Changes Saved Successfully!");
                                    }
                                    http.Response response2 = await http.post(
                                        'https://ipsm.org.ng/educand/get_profile.php',
                                        body: {
                                          'username': fnController2.text,
                                        });

                                    await FlutterSession()
                                        .set("userProfile", response2.body);
                                  } else {
                                    print(
                                        'Request failed with status: ${response.statusCode}.');
                                    Navigator.of(context).pop();
                                    _showErrorDialog("Connection Error!");
                                  }
                                } else {
                                  _showErrorDialog("Incomplete Details!");
                                }
                              },
                              title: "SAVE CHANGES",
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: (MediaQuery.of(context).size.height / 1.20),
                    right: 0,
                    left: (MediaQuery.of(context).size.width / 1.14),
                    child: Row(children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _uploadDialog();
                        },
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle,color:  Colors.blue[700],),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 6,
                              bottom: 6,
                              left: 6,
                              right: 6,
                            ),
                            child: Icon(
                              Icons.camera,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    child: SizedBox(
                      width: AppBar().preferredSize.height,
                      height: AppBar().preferredSize.height,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(
                              AppBar().preferredSize.height),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: DesignCourseAppTheme.nearlyWhite,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: Home(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        });
  }

  _showSuccessDialog(String text) {
    showDialog(
      context: context,
      // ignore: deprecated_member_use
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        content: Container(
          height: MediaQuery.of(context).size.height / 3.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle,
                size: 66,
                color: Color(0xFF10CA88),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text("Successful!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: new Container(
                height: MediaQuery.of(context).size.height / 12.0,
                child: Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Image.asset(
                        'assets/images/loading.gif',
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Text(
                        "Processing ...",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ]),
              ),
            ));
  }

  _showErrorDialog(String text) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: new Container(
                height: MediaQuery.of(context).size.height / 12.0,
                child: Row(children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.error,
                      size: 60,
                      color: Colors.redAccent,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ]),
              ),
            ));
  }

  Future<Map> userProfile() async {
    Map userProfile = await FlutterSession().get("userProfile");
    return userProfile;
  }
}
