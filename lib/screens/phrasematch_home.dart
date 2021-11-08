import 'dart:async';
import 'dart:convert';

import 'package:educand/screens/spacers.dart';
import 'package:educand/values/colors.dart';
import 'package:educand/widgets/submitbutton.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:http/http.dart' as http;

class PhrasematchHome extends StatefulWidget {
  @override
  _PhrasematchHomeState createState() => _PhrasematchHomeState();
}

class _PhrasematchHomeState extends State<PhrasematchHome> {
  TextEditingController fnController = TextEditingController();
  int wordcount = 0;
  int _correct = 0;
  int _wrong = 0;
  int buildcount = 0;
  List _wordList;
  String _singleValue = "";
  Timer _timer;
  int _start = 300;
  int _start_secs;
  int _start_mins;
  Future<List> getPhrase;

  @override
  void initState() {
    getPhrase = _getPhrase();
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _bottomSheet(_correct.toString());
            _timeupDialog();
          });
        } else {
          setState(() {
            _start--;
            _start_mins = (_start / 60).floor();
            _start_secs = _start - (_start_mins * 60);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: getPhrase,
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            List wordList = snapshot.data;
            _wordList = wordList;

            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  "Phrase Match Session",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                centerTitle: false,
                elevation: 0.0,
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
              body: Center(
                child: Container(
                  padding: EdgeInsets.only(
                      top: 0.0, left: 12.0, right: 12.0, bottom: 0.0),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xAAFFE9C6),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                      left: 5,
                                      right: 5,
                                    ),
                                    child: Text(
                                      "Session Time Remaining",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: c2,
                                      ),
                                    ),
                                  ),
                                ),
                                Xmargin(x: 10.0),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xAAFFE9C6),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                      left: 5,
                                      right: 5,
                                    ),
                                    child: Text(
                                      "$_start_mins" +
                                          "m " +
                                          "$_start_secs" +
                                          "s",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: c2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 8.0),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Card(
                                  color: c10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(14),
                                  )),
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    child: Center(
                                      child: Text(
                                        _correct.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 65,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  color: c11,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(14),
                                  )),
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    child: Center(
                                      child: Text(
                                        _wrong.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 65,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Padding(
                        //   padding: EdgeInsets.only(
                        //     top: 20,
                        //   ),
                        //   child: Center(
                        //     child: Row(
                        //       mainAxisAlignment:
                        //           MainAxisAlignment.spaceEvenly,
                        //       children: <Widget>[
                        //         Card(
                        //           color: Colors.green,
                        //           child: Padding(
                        //             padding: EdgeInsets.only(
                        //               top: 15,
                        //               bottom: 15,
                        //               left: 25,
                        //               right: 25,
                        //             ),
                        //             child: Text(
                        //               _correct.toString(),
                        //               style: TextStyle(
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 45,
                        //                 color: Colors.white,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //         Card(
                        //           color: Colors.redAccent,
                        //           child: Padding(
                        //             padding: EdgeInsets.only(
                        //               top: 15,
                        //               bottom: 15,
                        //               left: 25,
                        //               right: 25,
                        //             ),
                        //             child: Text(
                        //               _wrong.toString(),
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 45,
                        //                   color: Colors.white),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        Container(
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: c16,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Card(
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "From which of the following books can the following phrase be found : \n",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                      Text(
                                        wordList[wordcount]["phrase"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RadioButton(
                                      description: wordList[wordcount]
                                          ["option1"],
                                      value: wordList[wordcount]["option1"],
                                      groupValue: _singleValue,
                                      onChanged: (value) => setState(
                                        () => _singleValue = value,
                                      ),
                                    ),
                                    RadioButton(
                                      description: wordList[wordcount]
                                          ["option2"],
                                      value: wordList[wordcount]["option2"],
                                      groupValue: _singleValue,
                                      onChanged: (value) => setState(
                                        () => _singleValue = value,
                                      ),
                                    ),
                                    RadioButton(
                                      description: wordList[wordcount]
                                          ["option3"],
                                      value: wordList[wordcount]["option3"],
                                      groupValue: _singleValue,
                                      onChanged: (value) => setState(
                                        () => _singleValue = value,
                                      ),
                                    ),
                                    RadioButton(
                                      description: wordList[wordcount]
                                          ["option4"],
                                      value: wordList[wordcount]["option4"],
                                      groupValue: _singleValue,
                                      onChanged: (value) => setState(
                                        () => _singleValue = value,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SubmitButton(
                          title: "SUBMIT",
                          removePadding: true,
                          act: () {
                            if (equalsIgnoreCase(
                                _singleValue, wordList[wordcount]["answer"])) {
                              if (wordcount > 3) {
                                _correct++;
                                _bottomSheet(_correct.toString());
                              } else {
                                fnController.text = "";
                                _correct++;
                                _correctDialog("You answered correctly!");
                                wordcount = wordcount + 1;
                              }
                            } else {
                              if (wordcount > 3) {
                                _wrong++;
                                _bottomSheet(_correct.toString());
                              } else {
                                _wrong++;
                                fnController.text = "";
                                _wrongDialog("You picked the wrong book!");
                                wordcount = wordcount + 1;
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        )
                        // Padding(
                        //           padding: EdgeInsets.only(
                        //               top: 30, bottom: 10, right: 10, left: 10),
                        //           child: FlatButton(
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(4.0),
                        //             ),
                        //             color: Theme.of(context).primaryColor,
                        //             onPressed: () {
                        //             },
                        //             child: Container(
                        //               padding: EdgeInsets.symmetric(
                        //                 vertical: 15.0,
                        //                 horizontal: 10.0,
                        //               ),
                        //               child: Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: <Widget>[
                        //                   Expanded(
                        //                     child: Text(
                        //                       "SUBMIT",
                        //                       textAlign: TextAlign.center,
                        //                       style: TextStyle(
                        //                           color: Colors.white,
                        //                           fontSize: 15.0,
                        //                           fontWeight: FontWeight.bold),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text(
                    "Phrase Match Session",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
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
                  backgroundColor: c7,
                  // foregroundColor: c7,
                ),
                body: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: Text(
                      "... please wait ...",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }

  _timeupDialog() async {
    showDialog(
      context: context,
      // ignore: deprecated_member_use
      // I'm on 2.x
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        content: Container(
          height: MediaQuery.of(context).size.height / 3.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.warning,
                size: 66,
                color: Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "TIME UP!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    "You have exhausted the time for this session.",
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
    ).then((value) {});
  }

  _correctDialog(String text) async {
    showDialog(
      context: context,
      // ignore: deprecated_member_use
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        content: Container(
          height: MediaQuery.of(context).size.height / 3.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/ok_2x.png',
                width: 100,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "CORRECT",
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
    ).then((value) {
      setState(
        () => _singleValue = "",
      );
    });
  }

  _wrongDialog(String text) async {
    await showDialog(
      context: context,
      // ignore: deprecated_member_use
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        content: Container(
          height: MediaQuery.of(context).size.height / 3.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/error_2x.png',
                width: 100,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "WRONG",
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
    ).then((value) {
      setState(
        () => _singleValue = "",
      );
    });
  }

  _sessionDialog(String text) async {
    await showDialog(
      context: context,
      // ignore: deprecated_member_use
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        content: Container(
          height: MediaQuery.of(context).size.height / 2.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/ok_2x.png',
                width: 100,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Complete!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Text(
                    "PhraseMatch Session Complete.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Score: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        text + "/5",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Spacer(),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                color: Colors.orange[700],
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 0.0,
                    ),
                    child: Text(
                      "Done",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).then((value) async {
      Navigator.pop(context);
    });
  }

  _bottomSheet(String text) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            width: MediaQuery.of(context).size.width,
            height: 300.0,
            color: Color(0xFF737373), //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(
                    15.0,
                  ),
                  topRight: const Radius.circular(
                    15.0,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.asset(
                        'assets/images/ok_2x.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Center(
                      child: Text(
                        "Good Job!",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: Text(
                        "You have successfully completed phrase match test.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Colors.orange[700],
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 0.0,
                          ),
                          child: Text(
                            "See Test Results",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<List> _getPhrase() async {
    http.Response response =
        await http.post('https://ipsm.org.ng/educand/get_phrase.php');
    return jsonDecode(response.body);
  }

  bool equalsIgnoreCase(String string1, String string2) {
    return string1?.toLowerCase() == string2?.toLowerCase();
  }
}
