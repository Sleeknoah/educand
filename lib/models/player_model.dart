import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:educand/screens/game_results.dart';
import 'package:educand/utils/navigator.dart';
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
      Nav.routeReplacement(_ctx, GameResult());
      // showDialog(
      //     barrierDismissible: false,
      //     context: _ctx,
      //     builder: (BuildContext context) {
      //       return Dialog(
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(20.0)), //this right here
      //         child: Container(
      //           height: 250,
      //           child: Padding(
      //             padding: const EdgeInsets.all(12.0),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Text(
      //                   "Yayyy! You won!",
      //                   style: TextStyle(fontSize: 24),
      //                   textAlign: TextAlign.center,
      //                 ),
      //                 SizedBox(
      //                   width: 320.0,
      //                   child: RaisedButton(
      //                     onPressed: () async {
      //                       playerAmove = 0;
      //                       playerBmove = 0;
      //                       RestartWidget.restartApp(context);
      //                       Navigator.pop(context);
      //                     },
      //                     child: Text(
      //                       "New Game",
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                     color: const Color(0xFF1BC0C5),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       );
      //     });
    }
    //laddermove
    movePlayerA(5, 27, "made ethical use of information", "+");
    movePlayerA(
        29, 40, "used ICT skills to analyse and process information", "+");
    movePlayerA(
        37, 73, "evaluated media content and confirmed its safety", "+");
    movePlayerA(
        69, 80, "ascertained reliability and validity of data analysis", "+");
    movePlayerA(32, 44,
        "confirmed that all the sources of information are credible", "+");
    movePlayerA(48, 67,
        "confirmed broadcast messages on Whatsapp before forwarding", "+");
    movePlayerA(
        13,
        31,
        "shared my views in ways that that encourage discourse and not arguments",
        "+");
    movePlayerA(9, 19, "researched statements before sharing", "+");
    //snakeMove

    movePlayerA(
        97, 11, "didn’t log out after using a public/borrowed device", "-");
    movePlayerA(95, 84, "didn't create strong passwords", "-");
    movePlayerA(88, 76, "didn’t confirm the source of the video shared", "-");
    movePlayerA(28, 8, "shared controversial articles", "-");
    movePlayerA(71, 41, "ooops!!!! The video shared is fake", "-");
    movePlayerA(24, 6, "didn't researched a statement before sharing", "-");
    movePlayerA(57, 38, "ooops!!!! The video shared is fake", "-");
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
    movePlayerB(5, 27, "made ethical use of information", "+");
    movePlayerB(
        29, 40, "used ICT skills to analyse and process information", "+");
    movePlayerB(
        37, 73, "evaluated media content and confirmed its safety", "+");
    movePlayerB(
        69, 80, "ascertained reliability and validity of data analysis", "+");
    movePlayerB(32, 44,
        "confirmed that all the sources of information are credible", "+");
    movePlayerB(48, 67,
        "confirmed broadcast messages on Whatsapp before forwarding", "+");
    movePlayerB(
        13,
        31,
        "shared views in ways that that encourage discourse and not arguments",
        "+");
    movePlayerB(9, 19, "researched statements before sharing", "+");
    //snakeMove
    movePlayerB(
        97, 11, "didn’t log out after using a public/borrowed device", "-");
    movePlayerB(95, 84, "didn't create strong passwords", "-");
    movePlayerB(88, 76, "didn’t confirm the source of the video shared", "-");
    movePlayerB(28, 8, "shared controversial articles", "-");
    movePlayerB(71, 41, "shared a fake video", "-");
    movePlayerB(24, 6, "didn't researched a statement before sharing", "-");
    movePlayerB(57, 38, "shared a fake video", "-");
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
      ),
    ).then((value) {});
  }
}

PlayerModel playerModel = PlayerModel(_ctx);
