import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../screens/restart_app.dart';

BuildContext _ctx;

class PlayerModel with ChangeNotifier {
  int _playerAmove = 0;
  int _playerBmove = 0;
  int get playerAmove => _playerAmove;
  int get playerBmove => _playerBmove;
  String actioneffect;
  String movemessage;
  AudioCache audioCache = AudioCache();

  BuildContext get ctx => _ctx;
  PlayerModel(BuildContext c) {
    _ctx = c;
  }
  set ctx(BuildContext c) {
    _ctx = c;
    notifyListeners();
  }

  bool _won = false;
  bool get won => _won;
  set won(bool i) {
    _won = i;
    notifyListeners();
  }

  set playerAmove(int i) {
    _playerAmove = i;
    if (_playerAmove > 99) {
      // print("you won");
      audioCache.play('win.wav', mode: PlayerMode.LOW_LATENCY);
      won = true;
      showDialog(
          barrierDismissible: false,
          context: _ctx,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Yayyy! You won!",
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 320.0,
                        child: RaisedButton(
                          onPressed: () async {
                            playerAmove = 0;
                            playerBmove = 0;
                            RestartWidget.restartApp(context);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "New Game",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: const Color(0xFF1BC0C5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
    //laddermove
    movePlayerA(6, 28, "made ethical use of information", "+");
    movePlayerA(
        30, 41, "used ICT skills to analyse and process information", "+");
    movePlayerA(
        38, 74, "evaluated media content and confirmed its safety", "+");
    movePlayerA(
        70, 81, "ascertained reliability and validity of data analysis", "+");
    movePlayerA(33, 45,
        "confirmed that all the sources of information are credible", "+");
    movePlayerA(49, 68,
        "confirmed broadcast messages on Whatsapp before forwarding", "+");
    movePlayerA(
        14,
        32,
        "shared my views in ways that that encourage discourse and not arguments",
        "+");
    movePlayerA(10, 20, "researched statements before sharing", "+");
    //snakeMove
    movePlayerA(
        37, 4, "got angry easily and vented anger on people online", "-");
    movePlayerA(
        98, 12, "didn’t log out after using a public/borrowed device", "-");
    movePlayerA(96, 85, "didn't create strong passwords", "-");
    movePlayerA(89, 77, "didn’t confirm the source of the video shared", "-");
    movePlayerA(29, 9, "shared controversial articles", "-");
    movePlayerA(72, 42, "ooops!!!! The video shared is fake", "-");
    movePlayerA(25, 7, "didn't researched a statement before sharing", "-");
    movePlayerA(58, 39, "ooops!!!! The video shared is fake", "-");
    notifyListeners();
  }

  get playerBVal => _playerBmove;
  get playerAVal => _playerAmove;

  set playerBmove(int i) {
    // log('playerB moving....');
    _playerBmove = i;
    if (_playerBmove > 99) {
      // print("you won");
      audioCache.play('lose.wav', mode: PlayerMode.LOW_LATENCY);
      won = true;
      showDialog(
          barrierDismissible: false,
          context: _ctx,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Oops! Computer won!",
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 320.0,
                        child: RaisedButton(
                          onPressed: () async {
                            playerAmove = 0;
                            playerBmove = 0;
                            RestartWidget.restartApp(context);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "New Game",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: const Color(0xFF1BC0C5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
    //ladder
    movePlayerB(6, 28, "made ethical use of information", "+");
    movePlayerB(
        30, 41, "used ICT skills to analyse and process information", "+");
    movePlayerB(
        38, 74, "evaluated media content and confirmed its safety", "+");
    movePlayerB(
        70, 81, "ascertained reliability and validity of data analysis", "+");
    movePlayerB(33, 45,
        "confirmed that all the sources of information are credible", "+");
    movePlayerB(49, 68,
        "confirmed broadcast messages on Whatsapp before forwarding", "+");
    movePlayerB(
        14,
        32,
        "shared views in ways that that encourage discourse and not arguments",
        "+");
    movePlayerB(10, 20, "researched statements before sharing", "+");
    //snakeMove
    movePlayerB(
        37, 4, "got angry easily and vented anger on people online", "-");
    movePlayerB(
        98, 12, "didn’t log out after using a public/borrowed device", "-");
    movePlayerB(96, 85, "didn't create strong passwords", "-");
    movePlayerB(89, 77, "didn’t confirm the source of the video shared", "-");
    movePlayerB(29, 9, "shared controversial articles", "-");
    movePlayerB(72, 42, "shared a fake video", "-");
    movePlayerB(25, 7, "didn't researched a statement before sharing", "-");
    movePlayerB(58, 39, "shared a fake video", "-");
    notifyListeners();
  }

  movePlayerA(int init, int finalVal, String text, String move) async {
    // log('playerA moving....');
    if (playerModel.playerAmove == init) {
      await Future.delayed(Duration(seconds: 1), () {
        // log("time");
        playerModel.playerAmove = finalVal;
        actioneffect = "You " + text;
        movemessage = "You were just moved to " + (finalVal + 1).toString();
        _messageDialog(finalVal, actioneffect, movemessage, move);
        if (move == "+") {
          audioCache.play('reward.wav', mode: PlayerMode.LOW_LATENCY);
        } else {
          audioCache.play('reprimand.wav', mode: PlayerMode.LOW_LATENCY);
        }
        // notifyListeners();
      });
    } else {
      //  log('init not set --- $init');
    }
  }

  movePlayerB(int init, int finalVal, String text, String move) async {
    if (playerModel.playerBmove == init) {
      await Future.delayed(Duration(seconds: 1), () {
        // log("time");
        playerModel.playerBmove = finalVal;
        actioneffect = "Computer " + text;
        movemessage = "Computer was just moved to " + (finalVal + 1).toString();
        _messageDialog(finalVal, actioneffect, movemessage, move);
        if (move == "+") {
          audioCache.play('reward.wav', mode: PlayerMode.LOW_LATENCY);
        } else {
          audioCache.play('reprimand.wav', mode: PlayerMode.LOW_LATENCY);
        }
        // notifyListeners();
      });
    } else {
      // log('init not set --- $init');
    }
  }

  _messageDialog(int pos, String text, String movemessage, String move) async {
    showDialog(
      context: _ctx,
      // ignore: deprecated_member_use
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        content: Container(
          height: MediaQuery.of(_ctx).size.height / 2.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.info,
                size: 66,
                color: move == "+" ? Colors.green : Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Text(
                  movemessage,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
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
    ).then((value) {});
  }
}

PlayerModel playerModel = PlayerModel(_ctx);
