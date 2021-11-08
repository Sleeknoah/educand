import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';
import 'package:http/http.dart' as http;

class CHome extends StatefulWidget {
  @override
  _CHomeState createState() => _CHomeState();
}

class _CHomeState extends State<CHome> {
  TextEditingController fnController = TextEditingController();
  int wordcount = 0;
  int _correct = 0;
  int _wrong = 0;
  int buildcount = 0;
  List _wordList;

  @override
  void initState() {
    super.initState();
    VoiceController controller = FlutterTextToSpeech.instance.voiceController();
    controller.init().then((_) {
      controller.speak("");
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: _getWords(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            List wordList = snapshot.data;
            _wordList = wordList;

            if (buildcount == 0) {
              VoiceController controller =
                  FlutterTextToSpeech.instance.voiceController();
              controller.init().then((_) {
                controller.speak(
                  wordList[wordcount]["word"],
                );
              });
              buildcount++;
            }

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
                      "Summer Teenage SPELL&THRILL!",
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
                      padding: EdgeInsets.only(
                          top: 2.0, left: 6.0, right: 6.0, bottom: 2.0),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 6.0,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Card(
                                          color: Colors.green,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: 15,
                                              bottom: 15,
                                              left: 25,
                                              right: 25,
                                            ),
                                            child: Text(
                                              _correct.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 45,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Card(
                                          color: Colors.redAccent,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: 15,
                                              bottom: 15,
                                              left: 25,
                                              right: 25,
                                            ),
                                            child: Text(
                                              _wrong.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 45,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.66,
                                    padding: EdgeInsets.only(
                                      top: 45,
                                      bottom: 30,
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      color: Colors.grey,
                                      onPressed: () {
                                        VoiceController controller =
                                            FlutterTextToSpeech.instance
                                                .voiceController();
                                        controller.init().then((_) {
                                          controller.speak(
                                            wordList[wordcount]["word"],
                                          );
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 1.0,
                                          horizontal: 0.0,
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                "LISTEN AGAIN",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Card(
                                              color: Colors.grey,
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: IconButton(
                                                  onPressed: () {
                                                    VoiceController controller =
                                                        FlutterTextToSpeech
                                                            .instance
                                                            .voiceController();
                                                    controller.init().then((_) {
                                                      controller.speak(
                                                        wordList[wordcount]
                                                            ["word"],
                                                      );
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.volume_up,
                                                    size: 25,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                    bottom: 20,
                                  ),
                                  child: TextField(
                                    controller: fnController,
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      fillColor: Theme.of(context).dividerColor,
                                      hintText: 'Enter the pronounced Word',
                                      hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'Poppins',
                                        color: Colors.black54,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      filled: false,
                                      contentPadding: EdgeInsets.all(16),
                                    ),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text('Word Hint',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Ubuntu',
                                          fontSize: 15,
                                        ))),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                        "[" +
                                            wordList[wordcount]
                                                ["part_of_speech"] +
                                            "] " +
                                            wordList[wordcount]["description"],
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                        ))),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 30, bottom: 10, right: 10, left: 10),
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () {
                                      if (equalsIgnoreCase(fnController.text,
                                          wordList[wordcount]["word"])) {
                                        if (wordcount > 8) {
                                          _correct++;
                                          _sessionDialog(_correct.toString());
                                        } else {
                                          fnController.text = "";
                                          _correct++;
                                          _correctDialog(
                                              "You answered correctly!");
                                          wordcount = wordcount + 1;
                                        }
                                      } else {
                                        if (wordcount > 8) {
                                          _wrong++;
                                          _sessionDialog(_correct.toString());
                                        } else {
                                          _wrong++;
                                          fnController.text = "";
                                          _wrongDialog(
                                              wordList[wordcount]["word"]);
                                          wordcount = wordcount + 1;
                                        }
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15.0,
                                        horizontal: 10.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              "SUBMIT",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
          } else {
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
                      "Summer Teenage SPELL&THRILL!",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    backgroundColor: Colors.white,
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
                ));
          }
        });
  }

  _correctDialog(String text) async {
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
      VoiceController controller =
          FlutterTextToSpeech.instance.voiceController();
      controller.init().then((_) {
        controller.speak(
          _wordList[wordcount]["word"],
        );
      });
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
          height: MediaQuery.of(context).size.height / 3.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.cancel,
                size: 66,
                color: Colors.red,
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
                  child: Row(
                    children: <Widget>[
                      Text(
                        "The correct word is: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).then((value) {
      VoiceController controller =
          FlutterTextToSpeech.instance.voiceController();
      controller.init().then((_) {
        controller.speak(
          _wordList[wordcount]["word"],
        );
      });
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
          height: MediaQuery.of(context).size.height / 3.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle,
                size: 76,
                color: Color(0xFF10CA88),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Complete!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    "You have completed your session in this competition.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Score: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        text + "/10",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
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

  Future<List> _getWords() async {
    http.Response response =
        await http.post('https://ipsm.org.ng/educand/get_words.php');
    return jsonDecode(response.body);
  }

  bool equalsIgnoreCase(String string1, String string2) {
    return string1?.toLowerCase() == string2?.toLowerCase();
  }
}
