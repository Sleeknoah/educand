import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'player_model.dart';

class GameModel with ChangeNotifier {
  String _diceVal = "init";

  bool imDone = true;

  bool computer = false;
  String get diceVal => _diceVal;
  bool _playerAplaying = true;
  bool playerAplaying() => _playerAplaying;
  set diceVal(String i) {
    _diceVal = i;
    notifyListeners();
  }

  playerAplayingFun(bool i) {
    // log('former at $_playerAplaying and now at ');
    _playerAplaying = i;
    // log('at at --- $_playerAplaying');
    notifyListeners();
  }

  AudioCache audioCache = AudioCache();

  Future<void> gamePlay(val) async {
    // log('val is at $val');
    audioCache.play('dicee.wav', mode: PlayerMode.LOW_LATENCY);
    if (val.toString().contains("player1")) {
      imDone = false;
      notifyListeners();
      Future.delayed(Duration(milliseconds: 3000), () {
        imDone = true;
        notifyListeners();
      });
      if (playerModel.playerAmove == 0) {
        int temp =
            int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
        if (temp == 1) {
          playerModel.playerAmove +=
              int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
          await Future.delayed(Duration(seconds: 1));
          playerAplayingFun(false);
          notifyListeners();
        } else {
          playerModel.playerAmove = 0;
          await Future.delayed(Duration(seconds: 1));
          playerAplayingFun(false);
          // log('player A $_playerAplaying');
          notifyListeners();
        }
      } else {
        playerModel.playerAmove +=
            int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
        // playerAplaying = true;
        playerAplayingFun(false);
        // log('player A $_playerAplaying');
        notifyListeners();
        print(playerModel.playerAmove);
      }
      // gamePlay(val)
    } else if (val.toString().contains("player2")) {
      // log('here');
      imDone = false;
      computer = true;
      notifyListeners();

      Future.delayed(Duration(milliseconds: 3000), () {
        imDone = true;

        notifyListeners();
      });

      if (playerModel.playerBmove == 0) {
        int temp =
            int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
        if (temp == 1) {
          playerModel.playerBmove +=
              int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
          await Future.delayed(Duration(seconds: 1));
          // playerAplaying = false;
          playerAplayingFun(true);
          // log('player B $_playerAplaying');
          notifyListeners();
        } else {
          playerModel.playerBmove = 0;
          await Future.delayed(Duration(seconds: 1));
          // playerAplaying = false;
          playerAplayingFun(true);
          // log('player A $_playerAplaying');
          notifyListeners();
        }
      } else {
        playerModel.playerBmove +=
            int.parse(val.toString().trim().replaceRange(0, 7, "").trim());
        await Future.delayed(Duration(seconds: 2));
        // playerAplaying = false;
        playerAplayingFun(true);
        notifyListeners();
        // print(playerModel.playerBmove);
      }

      Future.delayed(Duration(milliseconds: 2000), () {
        computer = false;
      });
    }
  }
}
