import 'package:educand/values/colors.dart';
import 'package:educand/widgets/submitbutton.dart';
import 'package:flutter/material.dart';

import '../utils/navigator.dart';
import 'practice_level.dart';

class Practice extends StatefulWidget {
  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Practice Mode",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0.0,
        // foregroundColor: c7,
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
      body: Center(
        child: Container(
          padding:
              EdgeInsets.only(top: 2.0, left: 6.0, right: 6.0, bottom: 2.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: c7,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Card(
                    color: Colors.white24,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 24,
                        left: 24,
                        top: 14,
                      ),
                      child: Container(
                        child: Image.asset(
                          'assets/images/practice_illustration.png',
                          height: 160.0,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    padding: EdgeInsets.only(
                      top: 25,
                      bottom: 5,
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: Text(
                      'About SPELL&THRILL!',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'SPELL&THRILL! is an annual intervention based spelling competition project organized for both private and public primary and secondary schools in Nigeria.\n\nSPELL&THRILL! brings whole families together thereby helping to break intergenerational low educational and literacy skills.This has endeared SPELL&THRILL! as the leading literacy project of the new generation.\n\nIn the last seven (7) years, EEI has executed six (6) editions of SPELL&THRILL! successfully.',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          color: Colors.grey[200],
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.justify,
                      )),
                  SizedBox(height: 40.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SubmitButton(
                      title: "START SPELLING PRACTICE",
                      removePadding: true,
                      act: () => {Nav.route(context, PLevel())},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
