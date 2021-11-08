import 'package:flutter/material.dart';
import '../utils/navigator.dart';
import 'home.dart';
import 'package:getwidget/getwidget.dart';

class Faq extends StatefulWidget {
  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.blue[700]])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "FAQs",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: Container(
              padding:
                  EdgeInsets.only(top: 2.0, left: 6.0, right: 6.0, bottom: 2.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.white30,
                elevation: 6.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child:
                              Image.asset('assets/images/faq_illustration.png'),
                        ),
                        Container(
                            padding: EdgeInsets.only(
                              top: 15,
                              bottom: 5,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Center(
                                child: Text(
                                  'Frequently Asked Questions',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                        GFAccordion(
                          title: 'Can I get more thrill points?',
                          contentBackgroundColor: Colors.grey[100],
                          collapsedTitleBackgroundColor: Colors.grey[200],
                          content:
                              'Yes. You can earn more thrill points by participating in Games and Competitions. You can also purchase more thrill points from the EEI Store.',
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GFAccordion(
                          title: 'How can I contact the support team?',
                          contentBackgroundColor: Colors.grey[100],
                          collapsedTitleBackgroundColor: Colors.grey[200],
                          content:
                              'Head on to the main menu on the App and click the support button on your navigation list',
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GFAccordion(
                          title: 'How do I get App updates?',
                          contentBackgroundColor: Colors.grey[100],
                          collapsedTitleBackgroundColor: Colors.grey[200],
                          content:
                              'You can easily go to your Platforms App store to download any new updates as soon as we publish them.',
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GFAccordion(
                          title: 'Is your app secure?',
                          contentBackgroundColor: Colors.grey[100],
                          collapsedTitleBackgroundColor: Colors.grey[200],
                          content:
                              'Absolutely. All data transfer on this application is being done over a secure SSL encrypted server.',
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
