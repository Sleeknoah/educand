import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/submitbutton.dart';
import 'design_course_app_theme.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final double infoHeight = 364.0;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  String nameText;
  String emailText;
  String messageText;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.blue[700]])),
        child: Scaffold(
          backgroundColor: Colors.white10,
          body: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.2,
                      child:
                          Image.asset('assets/images/support_illustration.png'),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: DesignCourseAppTheme.nearlyWhite,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color:
                              DesignCourseAppTheme.nearlyWhite.withOpacity(0),
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
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 15,
                          ),
                          child: Text(
                            'Contact Support',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 24.0, right: 24.0),
                            child: TextField(
                              onChanged: (newText) {
                                nameText = newText;
                              },
                              controller: nameController,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).dividerColor,
                                hintText: "Your Name",
                                hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'Poppins',
                                  color: Colors.black54,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.all(16),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 24.0, right: 24.0),
                            child: TextField(
                              onChanged: (newText) {
                                emailText = newText;
                              },
                              controller: emailController,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).dividerColor,
                                hintText: "Your Email",
                                hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'Poppins',
                                  color: Colors.black54,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.all(16),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 24.0, right: 24.0),
                            child: TextField(
                              onChanged: (newText) {
                                messageText = newText;
                              },
                              controller: messageController,
                              maxLines: 7,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Theme.of(context).dividerColor,
                                hintText: "Your Message",
                                hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'Poppins',
                                  color: Colors.black54,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.all(16),
                              ),
                            ),
                          ),
                        ),
                        SubmitButton(
                          act: () async {
                            if (nameText != null &&
                                emailText != null &&
                                messageText != null) {
                              _showDialog();

                              http.Response response = await http.post(
                                  'https://ipsm.org.ng/educand/process_support.php',
                                  body: {
                                    'name': nameText,
                                    'email': emailText,
                                    'message': messageText,
                                  });
                              if (response.statusCode == 200) {
                                print(response.body);
                                if (response.body == "success") {
                                  Navigator.of(context).pop();
                                  _showSuccessDialog(
                                      "Your message has been sent to our support desk.");
                                  nameController.clear();
                                  emailController.clear();
                                  messageController.clear();
                                }
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
                          title: "SEND MESSAGE",
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: SizedBox(
                  width: AppBar().preferredSize.height,
                  height: AppBar().preferredSize.height,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          BorderRadius.circular(AppBar().preferredSize.height),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: DesignCourseAppTheme.nearlyBlack,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              )
            ],
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
                child: Text(
                  "Successful!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
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
}
